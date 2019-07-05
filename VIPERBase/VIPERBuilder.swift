//
//  VIPERBuilder.swift
//  VIPERBase
//
//  Created by Rafael on 03/01/19.
//  Copyright © 2019 Rafael Ribeiro da Silva. All rights reserved.
//

import UIKit

/**
 Use this class to build a customized VIPER module.
 
 In order to use this generic class, you must inform:
 
 - Class type for `View`;
 - Class type for `Presenter`;
 - Class type for `Interactor`;
 - Class type for `Router`;
 
 # See below some usage examples:
 
 **- Defining a new class for the builder**
 
 This method allows you to define custom build methods for the module.
 
     final class ModuleBuilder: VIPERBuilder<ModuleView, ModulePresenter, ModuleInteractor, ModuleRouter> {
 
     }
 
 If the module has a storyboard file for the view UI, you have to override `defaultViewUIType` class property,
 specifying the file name and bundle:
 
     override class var defaultViewUIType: VIPERViewUIType {
        return .storyboard(name: "ModuleView", bundle: nil)
     }
 
 If the module has a XIB file for the view UI, you have to override `defaultViewUIType` class property,
 specifying the file name and bundle:
 
     override class var defaultViewUIType: VIPERViewUIType {
        return .nib(name: "ModuleView", bundle: nil)
     }
 
 ---
 
 **- Defining a typealias**
 
 Use this method if you intent to perform **unit tests** around the module communication, **mocking one or more layer classes**.
 This method is convenient because allows you to define the type locally, inside the test method:
 
     typealias ModuleBuilder = VIPERBuilder<ModuleMockView, ModuleOriginalPresenter, ModuleOriginalInteractor, ModuleOriginalRouter>
 */
open class VIPERBuilder<ViewType: UIViewController & VIPERView, PresenterType: VIPERPresenter, InteractorType: VIPERInteractor, RouterType: VIPERRouter> {
    
    open class var defaultViewUIType: VIPERViewUIType {
        return .none
    }
   
    private init() {}
}

public extension VIPERBuilder {
    
    /**
     Creates the module.
     
     - Parameter viewUIType: View UI file type.
     - Returns: The created module, containing both `view` and `presenter` references.
     */
    class func build(viewUIType: VIPERViewUIType? = nil) -> VIPERModule<ViewType, PresenterType, InteractorType, RouterType> {
        let view: ViewType
        let presenter = PresenterType()
        let interactor = InteractorType()
        let router = RouterType()
        
        let type = viewUIType ?? defaultViewUIType
        
        switch type {
            case .storyboard(let name, let bundle):
                view = UIStoryboard(name: name, bundle: bundle).instantiateInitialViewController() as! ViewType

            case .nib(let name, let bundle):
                view = ViewType()
                UINib(nibName: name, bundle: bundle).instantiate(withOwner: view, options: nil)

            case .none:
                view = ViewType()
        }
        
        view.presenter = presenter as? ViewType.Presenter
        presenter.view = view as? PresenterType.View
        presenter.router = router as? PresenterType.Router
        presenter.interactor = interactor as? PresenterType.Interactor
        interactor.presenter = presenter as? InteractorType.Presenter
        router.viewController = view
        
        return VIPERModule(
            view: view,
            presenter: presenter,
            interactor: interactor,
            router: router
        )
    }

    /**
     Build the module and attach its view to a window.
     
     - Important:
        If it is necessary to pass some data to the module, consider creating a custom build method in the module builder class
        or use 'build' method instead.
     
     - Returns: Created window.
     */
    @available(*, deprecated, message: "This will be removed in v3.0. Use 'build()' or 'build(viewUIType:)' methods instead, then call 'attachToWindow()' method of the created module.")
    static func buildAndAttachToWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = build().view
        window.makeKeyAndVisible()
        return window
    }

    /**
     Build the module and attach its view to a navigation controller.
     
     - Important:
        If it is necessary to pass some data to the module, consider creating a custom build method in the module builder class
        or use 'build' method instead.
     
     - Returns: Created navigation controller.
     */
    @available(*, deprecated, message: "This will be removed in v3.0. Use 'build()' or 'build(viewUIType:)' methods instead, then call 'attachToNavigationController()' method of the created module.")
    static func buildAndAttachToNavigationController(tabBarItem: UITabBarItem? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: build().view)
        
        if let item = tabBarItem {
            navigationController.tabBarItem = item
        }
        
        return navigationController
    }
}
