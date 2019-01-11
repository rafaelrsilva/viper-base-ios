//
//  VIPERBuilder.swift
//  VIPERBase
//
//  Created by Rafael on 03/01/19.
//  Copyright © 2019 Rafael Ribeiro da Silva. All rights reserved.
//

import UIKit

/**
 Protocol that defines the **VIPER builder** base functionality and what is needed to configure a new VIPER module
 */
public protocol VIPERBuilder: class {
    
    /**
     Associated type of the view layer of the module
     */
    associatedtype View: UIViewController & VIPERView
    
    /**
     Associated type of the presenter layer of the module
     */
    associatedtype Presenter: VIPERPresenter
    
    /**
     Associated type of the interactor layer of the module
     */
    associatedtype Interactor: VIPERInteractor
    
    /**
     Associated type of the router layer of the module
     */
    associatedtype Router: VIPERRouter
    
    /**
     View UI file type
     */
    static var viewType: VIPERBaseViewType { get }
}

public extension VIPERBuilder {
    
    /**
     Creates the module
     
     - Returns: Both view and presenter layers of the module
     */
    static func build() -> (view: View, presenter: Presenter) {
        let view: View
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()
        
        switch viewType {
            case .storyboard(let name, let bundle):
                view = UIStoryboard(name: name, bundle: bundle).instantiateInitialViewController() as! View

            case .nib(let name, let bundle):
                view = View()
                UINib(nibName: name, bundle: bundle).instantiate(withOwner: view, options: nil)

            case .none:
                view = View()
        }
        
        view.presenter = presenter as? Self.View.Presenter
        presenter.view = view as? Self.Presenter.View
        presenter.router = router as? Self.Presenter.Router
        presenter.interactor = interactor as? Self.Presenter.Interactor
        interactor.presenter = presenter as? Self.Interactor.Presenter
        router.viewController = view
        
        return (view, presenter)
    }

    /**
     Build the module and attach its view to a window
     
     - Important:
        If it is necessary to pass some data to the module, consider creating a custom build method in the module builder class
        or use 'build' method instead
     
     - Returns: Created window
     */
    static func buildAndAttachToWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = build().view
        window.makeKeyAndVisible()
        return window
    }

    /**
     Build the module and attach its view to a navigation controller
     
     - Important:
        If it is necessary to pass some data to the module, consider creating a custom build method in the module builder class
        or use 'build' method instead
     
     - Returns: Created navigation controller
     */
    static func buildAndAttachToNavigationController(tabBarItem: UITabBarItem? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: build().view)
        
        if let item = tabBarItem {
            navigationController.tabBarItem = item
        }
        
        return navigationController
    }
}
