//
//  VIPERBaseRouter.swift
//  VIPERBase
//
//  Created by Rafael on 27/08/18.
//  Copyright © 2018 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

/**
 Protocol that defines the **VIPER router layer** base functionality and specify what must be implemented by the application routers
 
 This base router takes care of the **module layers creation**, as well as their **relationship with each other**.
 
 - Important:
    The router layer, in this case, has to know about UIKit, UIViewController and its subclasses, needed to perform navigation
    between view. Its **viewController reference** is just for this purpose
 */
public protocol VIPERBaseRouter: class {
    
    ///View controller reference just for performing navigation
    var viewController: UIViewController! { get set }
    
    /**
     Creates the view of the VIPER module
     
     - Returns: Created view
     */
    static func createView() -> VIPERBaseView
    
    /**
     Creates the presenter of the VIPER module
     
     - Returns: Created presenter
     */
    static func createPresenter() -> VIPERBasePresenter
    
    /**
     Creates the interactor of the VIPER module
     
     - Returns: Created interactor
     */
    static func createInteractor() -> VIPERBaseInteractor
    
    /**
     Creates the router of the VIPER module
     
     - Returns: Created router
     */
    static func createRouter() -> VIPERBaseRouter
}

public extension VIPERBaseRouter {
    
    /**
     Creates the module and all VIPER layers
     
     - Parameter embedIn: Embed options for the view controller of the created module. **Default: .None**
    
     - Returns: View controller of the created module to be used to perform navigation
     */
    public static func createModule(embedIn: VIPERModuleEmbedType = .None) -> UIViewController {
        let view = createView()
        let presenter = createPresenter()
        let interactor = createInteractor()
        let router = createRouter()
        
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
        
        view.basePresenter = presenter
        presenter.baseView = view
        presenter.baseRouter = router
        presenter.baseInteractor = interactor
        interactor.basePresenter = presenter
        
        return router.viewController
    }
    
    /**
     Presents a VIPER module modally
     
     - Parameter destination: View controller of the destination module
     - Parameter embedIn: Embed the view controller before navigation
     - Parameter animated: Perform animation. **Default: true**
     - Parameter completion: Handler to execute after presentation. **Default: nil**
     */
    public func presentModule(withView destination: UIViewController, embedIn: VIPERModuleEmbedType = .None, animated: Bool = true, completion: (() -> Void)? = nil) {
        let viewControllerToPresent: UIViewController
        
        switch embedIn {
            case .NavigationController:
                viewControllerToPresent = UINavigationController(rootViewController: destination)
            
            case .TabBarController:
                let tab = UITabBarController()
                tab.viewControllers = [destination]
                viewControllerToPresent = tab
            
            default:
                viewControllerToPresent = destination
        }
        
        if let navigationController = viewController.navigationController {
            navigationController.present(viewControllerToPresent, animated: animated, completion: completion)
            return
        }
        
        viewController.present(viewControllerToPresent, animated: animated, completion: completion)
    }
    
    /**
     Pushes a VIPER module onto the receiver’s stack and updates the display.

     - Parameter destination: View controller of the destination module
     - Parameter embedIn: Embed the view controller before navigation
     - Parameter animated: Perform animation. **Default: true**
     */
    public func pushModule(withView destination: UIViewController, embedIn: VIPERModuleEmbedType = .None, animated: Bool = true) {
        let viewControllerToPush: UIViewController
        
        switch embedIn {
            case .NavigationController:
                viewControllerToPush = UINavigationController(rootViewController: destination)
            
            case .TabBarController:
                let tab = UITabBarController()
                tab.viewControllers = [destination]
                viewControllerToPush = tab
            
            default:
                viewControllerToPush = destination
        }
        
        if let navigationController = viewController as? UINavigationController {
            navigationController.pushViewController(viewControllerToPush, animated: animated)
            return
        }
        
        viewController.navigationController?.pushViewController(viewControllerToPush, animated: animated)
    }
}
