//
//  VIPERBaseRouter.swift
//  VIPERBase
//
//  Created by Rafael on 27/08/18.
//  Copyright © 2018 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

/**
 Protocol that defines the **VIPER router** base functionality and specify what must be
 implemented by the application routers
 
 This base router takes care of the **module layers creation**, as well as their
 **relationship with each other**.
 
 - Important:
    The router layer, in this case, has to know about UIKit, UIViewController
    and its subclasses, needed to perform navigation between view.
    Its viewController reference is just for this purpose
 */
public protocol VIPERBaseRouter: class {
    
    ///View controller reference just for performing navigation
    var viewController: UIViewController! { get set }
    
    /**
     Creates the view of the VIPER module
     
     - Returns: Created view
     */
    static func getView() -> VIPERBaseView
    
    /**
     Creates the presenter of the VIPER module
     
     - Returns: Created presenter
     */
    static func getPresenter() -> VIPERBasePresenter
    
    /**
     Creates the interactor of the VIPER module
     
     - Returns: Created interactor
     */
    static func getInteractor() -> VIPERBaseInteractor
    
    /**
     Creates the router of the VIPER module
     
     - Returns: Created router
     */
    static func getRouter() -> VIPERBaseRouter
}

public extension VIPERBaseRouter {
    
    /**
     Creates the module and all VIPER layers
     
     - Parameter embedIn: Embed options for the view controller of the created module. **Default: .None**
    
     - Returns: View controller of the created module to be used to perform navigation
     */
    public static func createModule(embedIn: VIPERModuleEmbedType = .None) -> UIViewController {
        let view = getView()
        let presenter = getPresenter()
        let interactor = getInteractor()
        let router = getRouter()
        
        switch embedIn {
            case .NavigationController:
                router.viewController = UINavigationController(rootViewController: view as! UIViewController)
            
            case .TabBarController:
                let tabBar = UITabBarController()
                tabBar.viewControllers = [view as! UIViewController]
                router.viewController = tabBar
            
            case .None:
                fallthrough
            
            default:
                router.viewController = view as! UIViewController
        }
        
        view.presenter = presenter
        presenter.router = router
        presenter.view = view
        view.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return router.viewController
    }
    
    /**
     Presents a VIPER module modally
     
     - Parameter destination: View controller of the destination module
     - Parameter animated: Perform animation. **Default: true**
     - Parameter completion: Handler to execute after presentation. **Default: nil**
     */
    public func presentModule(withView destination: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        viewController.present(destination, animated: animated, completion: completion)
    }
    
    /**
     Pushes a VIPER module onto the receiver’s stack and updates the display.

     - Parameter destination: View controller of the destination module
     - Parameter animated: Perform animation. **Default: true**
     */
    public func pushModule(withView destination: UIViewController, animated: Bool = true) {
        if let navigationController = viewController as? UINavigationController {
            navigationController.pushViewController(destination, animated: animated)
            return
        }
        
        viewController.navigationController?.pushViewController(destination, animated: animated)
    }
}
