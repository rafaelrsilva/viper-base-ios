//
//  VIPERModule.swift
//  VIPERBase
//
//  Created by Rafael on 12/03/19.
//  Copyright © 2019 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

/**
 Struct that represents a created VIPER module.
 */
public struct VIPERModule<View: UIViewController & VIPERView, Presenter: VIPERPresenter> {
    
    /**
     View of the module
     */
    public let view: View
    
    /**
     Presenter of the module
     */
    public let presenter: Presenter
    
    /**
     Attach the view of the module to a window
     
     - Parameter navigationController: Boolean value indicating whether the view should also be attached to a navigation controller. `Defaul = false`

     - Returns: Created window
     */
    public func attachToWindow(withNavigationController navigationController: Bool = false) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController ? attachToNavigationController() : view
        window.makeKeyAndVisible()
        return window
    }
    
    /**
     Attach the view of the module to a navigation controller
     
     - Returns: Created navigation controller
     */
    public func attachToNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: view)
    }
}
