//
//  VIPERRouter.swift
//  VIPERBase
//
//  Created by Rafael on 27/08/18.
//  Copyright © 2018 Rafael Ribeiro da Silva. All rights reserved.
//

import UIKit

/**
 Protocol that defines the **Router** layer of VIPER architecture.
 
 - Important:
    The router layer, in this case, has to know about UIKit, UIViewController and its subclasses, needed to perform navigation
    between view. Its **viewController reference** is just for this purpose.
 */
public protocol VIPERRouter: VIPERBaseLayer {
    
    /**
     View controller reference, just for performing navigation.
     */
    var viewController: UIViewController! { get set }
}

// MARK: - Public methods

public extension VIPERRouter {
    
    /**
     Presents a VIPER module modally.
     
     - Parameter destination: View controller of the destination module.
     - Parameter embedIn: Embed the view controller before navigation.
     - Parameter animated: Perform animation. **Default: true**
     - Parameter completion: Handler to execute after presentation. **Default: nil**
     */
    func presentModule(withView destination: UIViewController, embedIn: VIPERModuleEmbedType = .none, animated: Bool = true, completion: (() -> Void)? = nil) {
        let viewControllerToPresent = getViewControllerToShow(destination, embedIn: embedIn)
        
        if let navigationController = viewController.navigationController {
            navigationController.present(viewControllerToPresent, animated: animated, completion: completion)
            return
        }
        
        viewController.present(viewControllerToPresent, animated: animated, completion: completion)
    }
    
    /**
     Pushes a VIPER module onto the receiver’s stack and updates the display.

     - Parameter destination: View controller of the destination module.
     - Parameter embedIn: Embed the view controller before navigation.
     - Parameter animated: Perform animation. **Default: true**
     */
    func pushModule(withView destination: UIViewController, embedIn: VIPERModuleEmbedType = .none, animated: Bool = true) {
        let viewControllerToPush = getViewControllerToShow(destination, embedIn: embedIn)
        
        if let navigationController = viewController as? UINavigationController {
            navigationController.pushViewController(viewControllerToPush, animated: animated)
            return
        }
        
        viewController.navigationController?.pushViewController(viewControllerToPush, animated: animated)
    }
}

// MARK: - Private methods

private extension VIPERRouter {
    
    /**
     Prepares the view controller according to the embed type.
     
     - Parameter viewControllerToShow: View controller to be prepared.
     - Parameter embedIn: Embed type for the view controller.
     - Returns: The prepared view controller.
     */
    func getViewControllerToShow(_ viewControllerToShow: UIViewController, embedIn: VIPERModuleEmbedType) -> UIViewController {
        switch embedIn {
            case .navigationController:
                return UINavigationController(rootViewController: viewControllerToShow)
                
            case .none:
                return viewControllerToShow
        }
    }
}
