//
//  VIPERBaseBuilder.swift
//  VIPERBase
//
//  Created by Rafael on 03/01/19.
//  Copyright © 2019 Rafael Ribeiro da Silva. All rights reserved.
//

import UIKit

/**
 Protocol that defines the **VIPER builder** base functionality and what is needed to configure a new VIPER module
 */
public protocol VIPERBaseBuilder: class {
    
    /**
     Associated type of the view layer of the module
     */
    associatedtype View: UIViewController & VIPERBaseView
    
    /**
     Associated type of the presenter layer of the module
     */
    associatedtype Presenter: VIPERBasePresenter
    
    /**
     Associated type of the interactor layer of the module
     */
    associatedtype Interactor: VIPERBaseInteractor
    
    /**
     Associated type of the router layer of the module
     */
    associatedtype Router: VIPERBaseRouter
    
    /**
     View UI file type
     */
    static var viewType: VIPERBaseViewType { get }
}

public extension VIPERBaseBuilder {
    
    /**
     Creates the module and its VIPER layers
     
     - Returns: Both view and presenter layers of the module
     */
    static func buildModule() -> (view: View, presenter: Presenter) {
        let view: View
        
        switch viewType {
            case .storyboard(let name, let bundle):
                view = UIStoryboard(name: name, bundle: bundle).instantiateInitialViewController() as! View

            case .nib(let name, let bundle):
                view = View()
                UINib(nibName: name, bundle: bundle).instantiate(withOwner: view, options: nil)

            case .none:
                view = View()
        }
        
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()
        
        view.basePresenter = presenter
        presenter.baseView = view
        presenter.baseRouter = router
        presenter.baseInteractor = interactor
        interactor.basePresenter = presenter
        router.viewController = view
        
        return (view, presenter)
    }
}
