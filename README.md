# VIPERBase


VIPERBase is a implementation of VIPER architecture for using in iOS platform.

This project aims to make VIPER usage and adoption easier, taking care of module creation and configuration


## Installation

### CocoaPods

CocoaPods is a dependency manager for Cocoa projects. To install CocoaPods, use the command below:

```
$ sudo gem install cocoapods
```

After install CocoaPods, specify this pod in your `Podfile`:

```Ruby
pod 'viper-base', '~> 2.0'
```

Then, run the command below:

```
$ pod install
```

## Xcode template installation

The bad experience you may have when using VIPER is to create, by yourself, all files, classes and protocols needed by VIPER architecture.
Using the xcode template, this hard work is done automatically.

To install and use this template, check this [tutorial](https://github.com/rafaelrsilva/viper-base-ios/templates).

## Module overview

A module represents a screen of the app.

![](https://raw.githubusercontent.com/rafaelrsilva/viper-base-ios/assets/template/viper-base-diagram.png)


This implementation of VIPER, has some particularities:


- **Builder component**

Some approaches consider the module creation task as a responsibility of the **router**. But this violates the **Single Responsibility Principle**, since it is already responsible for navigation between module.

To solve this problem, **builder** was created. It is in charge of creating all components of the module and make the connections.

- **Decoupling between module and entities**

This way, entities can be used in one or more modules, since they are simple structures with no business logic.

- **Router owns a reference to view**

Because in iOS architecture, the navigation is performed **from a UIViewController to another UIViewController**.

Router owns the refecence for the view of the current module, just for navigation purpose, and receive the view of the destination module from its builder.

## Module components

### Contracts

The contracts define how the communication between the layers will be made. Consists of 5 contracts:

#### View Contract

The view class conforms to this protocol. It defines the communication from **presenter** to **view**

```swift
//MARK: - View Contract

protocol MyModuleViewProtocol: class {

}
```

#### View Output Contract

The presenter class conforms to this protocol. It defines the communication from **view** to **presenter**

```swift
//MARK: - View Output Contract

protocol MyModuleViewOutputProtocol: class {

}
```

#### Interactor Contract

The interactor class conforms to this protocol. It defines the communication from **presenter** to **interactor**

```swift
//MARK: - Interactor Contract

protocol MyModuleInteractorProtocol: class {

}
```

#### Interactor Output Contract 

The presenter class conforms to this protocol. It defines the communication from **interactor** to **presenter**

```swift
//MARK: - Interactor Output Contract

protocol MyModuleInteractorOutputProtocol: class {

}
```

#### Router Contract

The router class conforms to this protocol. It defines the communication from **presenter** to **router**

```swift
//MARK: - Router Contract

protocol MyModuleRouterProtocol: class {

}
```

---

### Presenter

```swift
final class MyModulePresenter: VIPERPresenter {
    weak var view: MyModuleViewProtocol!
    var interactor: MyModuleInteractorProtocol!
    var router: MyModuleRouterProtocol!
}

//MARK: - MyModuleViewOutputProtocol

extension MyModulePresenter: MyModuleViewOutputProtocol {

}

//MARK: - MyModuleInteractorOutputProtocol

extension MyModulePresenter: MyModuleInteractorOutputProtocol {

}
```

---

### Interactor


```swift
final class MyModuleInteractor: VIPERInteractor {
    weak var presenter: MyModuleInteractorOutputProtocol!
}

//MARK: - MyModuleInteractorProtocol

extension MyModuleInteractor: MyModuleInteractorProtocol {

}
```

---

### Router 

The router is responsible to perform the navigation between modules.

```swift
final class MyModuleRouter: VIPERRouter {
    weak var viewController: UIViewController!
}

//MARK: - MyModuleRouterProtocol

extension MyModuleRouter: MyModuleRouterProtocol {

}
```

---

### View

```swift
final class MyModuleView: UIViewController, VIPERView {
    var presenter: MyModuleViewOutputProtocol!
}

//MARK: - MyModuleViewProtocol

extension MyModuleView: MyModuleViewProtocol {

}
```

---

### Builder

In the builder class, you specify the respective classes for **view**, **presenter**, **interactor** and **router** for that module.

```swift
final class MyModuleBuilder: VIPERBuilder {
    typealias View = MyModuleView
    typealias Presenter = MyModulePresenter
    typealias Interactor = MyModuleInteractor
    typealias Router = MyModuleRouter

    static var viewType: VIPERBaseViewType {
        return .storyboard(name: "MyModuleView", bundle: nil)
    }
}

//MARK: - Builder custom methods

extension MyModuleBuilder {

}
```

You also define the way the view UI will be loaded, through the `viewType` property. There are three possible values:

#### Storyboard file

You just need to inform the name of the storyboard file, without extension, and the bundle, if needed.

```swift
return .storyboard(name: "MyModuleView", bundle: nil)
```

#### NIB/XIB file

You just need to inform the name of the XIB file, without extension, and the bundle, if needed.

```swift
return .nib(name: "MyModuleView", bundle: nil)
```

#### None

If you intent to implement the UI programmatically, use this option.

```swift
return .none
```


## License

VIPERBase is released under the MIT license.