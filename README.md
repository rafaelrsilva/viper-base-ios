# VIPERBase

VIPERBase aims to reduce code boilerplates needed when using VIPER architecture, specially when it comes to implementing navigation between modules and module creation.

## Installation

### CocoaPods

CocoaPods is a dependency manager for Cocoa projects.

To install CocoaPods, use the command below:

```
$ sudo gem install cocoapods
```


After install CocoaPods, specify this library as dependency in `Podfile`:

```Ruby
target '<YOUR TARGET NAME>' do

	pod 'viper-base', '~> 1.0'

end
```


Then, run the command below:

```
$ pod install
```

## Usage

This library infers that all VIPER modules contains the following layers:

- View
- Presenter
- Interactor
- Router


### Creating a View

Import `VIPERBase`, conform the class with `VIPERBaseView` protocol and declare **presenter** property:

```swift
import VIPERBase

class MyModuleView: UIViewController, VIPERBaseView, MyModuleViewProtocol {

	var presenter: VIPERBasePresenter!
}
```

**OBS.:** In order to access **presenter layer** methods, it is necessary to cast property to the respective protocol.
See below, an implementation example:

```swift

class MyModuleView: UIViewController, VIPERBaseView, MyModuleViewProtocol {
	
	//...

	@IBAction func goToSecondModule(_ sender: Any) {
		(presenter as? MyModuleViewOutputProtocol)?.didRequestSecondModule()
	}

	@IBAction func goToThirdModule(_ sender: Any) {
		(presenter as? MyModuleViewOutputProtocol)?.didRequestThirdModule()
	}

	@IBAction func updateData(_ sender: Any) {
		(presenter as? MyModuleViewOutputProtocol)?.didRequestUpdatedData()
	}

	//MARK: - MyModuleViewProtocol

	func showUpdatedData(data: [Any]) {
		//Some UI logic
	}
}
```

---

### Creating a Presenter

Import `VIPERBase`, conform the class with `VIPERBasePresenter` protocol and declare **view**, **router** and **interactor** properties:

```swift
import VIPERBase

class MyModulePresenter: VIPERBasePresenter, MyModuleViewOutputProtocol, MyModuleInteractorOutputProtocol {
	
	weak var view: VIPERBaseView!
    var router: VIPERBaseRouter!
    var interactor: VIPERBaseInteractor!
}
```

**OBS.:** In order to access layers methods, it is necessary to cast properties to the respective protocol. 
See below, an implementation example:

```swift

class MyModulePresenter: VIPERBasePresenter, MyModuleViewOutputProtocol, MyModuleInteractorOutputProtocol {
	
	//...

	//MARK: - MyModuleViewOutputProtocol

	func didRequestSecondModule() {
		(router as? MyModuleRouterProtocol)?.goToMySecondModule()
	}

	func didRequestThirdModule() {
		(router as? MyModuleRouterProtocol)?.goToMyThirdModule()
	}

	func didRequestUpdatedData() {
		(interactor as? MyModuleInteractorProtocol)?.fetchUpdatedData()
	}

	//MARK: - MyModuleInteractorOutputProtocol

	func didFetchUpdatedData(data: [Any]) {
		(view as? MyModuleViewProtocol)?.showUpdatedData(data)
	}
}
```

---

### Creating an Interactor

Import `VIPERBase`, conform the class with `VIPERBaseInteractor` protocol and declare **presenter** property:

```swift
import VIPERBase

class MyModuleInteractor: VIPERBaseInteractor, MyModuleInteractorProtocol {

	weak var presenter: VIPERBasePresenter!
}
```

**OBS.:** In order to access **presenter layer** methods, it is necessary to cast property to the respective protocol. 
See below, an implementation example:


```swift

class MyModuleInteractor: VIPERBaseInteractor, MyModuleInteractorProtocol {
	
	//...

	//MARK: - MyModuleInteractorProtocol

	func fetchUpdatedData() {
		//Some business logic to fetch data
		//...

		(presenter as? MyModuleInteractorOutputProtocol)?.didFetchUpdatedData(data)
	}
}
```

---

### Creating a Router

The router is responsible to perform the navigation between modules and creates its own module layers
To create a router, import `VIPERBase`, conform the class with `VIPERBaseRouter` and declare viewController property and the static methods:

```swift
import VIPERBase

class MyModuleRouter: VIPERBaseRouter, MyModuleRouterProtocol {
    
    var viewController: UIViewController!
    
    static func getView() -> VIPERBaseView {

    	//If you are using storyboard
    	let storyboard = UIStoryboard(name: "StoryboardName", bundle: nil)
    	let viewByStoryboard = storyboard.instantiateViewController(withIdentifier: "MyModuleView") as! MyModuleView 

    	//If you are using XIBs
    	let viewByXIB = MyModuleView(nibName: "MyModuleView", bundle: nil)

    	return viewByStoryboard
    }
    
    static func getPresenter() -> VIPERBasePresenter {
    	return MyModulePresenter()
    }
    
    static func getInteractor() -> VIPERBaseInteractor {
    	return MyModuleInteractor()
    }
    
    static func getRouter() -> VIPERBaseRouter {
    	return MyModuleRouter()
    }
}
```

The methods `getView`, `getPresenter`, `getInteractor`, `getRouter` are used to create and configure module.
The `viewController` property is needed to perform navigation between modules. 

---

### Creating a VIPER Module

With all module layers classes created, everything is ready to create a module.
To create a module use the method `createModule()` or `createModule(embedIn:)`  

```swift
let myModuleViewController = MyModuleRouter.createModule()
```

If you want to embed you module in a navigation controller:

```swift
let myModuleViewController = MyModuleRouter.createModule(embedIn: .NavigationController)
```

If you want to embed you module in a tab bar controller:

```swift
let myModuleViewController = MyModuleRouter.createModule(embedIn: .TabBarController)
```


The `createModule` return is a reference to view controller, needed to perform navigation 

---

### Presenting a Module

#### From a module to another

Inside origin module router:

```swift
class MyModuleRouter: VIPERBaseRouter, MyModuleRouterProtocol {
	//...

	//MARK: - MyModuleRouterProtocol

	func goToMySecondModule() {
		presentModule(withView: MySecondModuleRouter.createModule(), animated: true, completion: nil)
	}

	func goToMyThirdModule() {
		pushModule(withView: MyThirdModuleRouter.createModule(), animated: false)
	}
}
```

The `presentModule` method presents the next module modally, while the `pushModule` pushes the next module in a navigation controller (if exists)

#### Set a module as an initial module of the application

Insert the following code inside `application(_:didFinishLaunchingWithOptions:)` method, in AppDelegate:


```swift
import VIPERBase

class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	//...
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MyModuleRouter.createModule(embedIn: .NavigationController)
        window?.makeKeyAndVisible()

        //...

        return true
	}

	//...
}	
```

## License

VIPERBase is releases under the MIT license.
























































