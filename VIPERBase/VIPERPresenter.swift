//
//  VIPERPresenter.swift
//  VIPERBase
//
//  Created by Rafael on 27/08/18.
//  Copyright © 2018 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

/**
 Protocol that defines the **Presenter** layer of VIPER architecture.
 */
public protocol VIPERPresenter: VIPERBaseLayer {
    
    /**
     Type of the view in the presenter layer.
     */
    associatedtype View
    
    /**
     Type of the interactor in the presenter layer.
     */
    associatedtype Interactor
    
    /**
     Type of the router in the presenter layer.
     */
    associatedtype Router
    
    /**
     View of the module.
     */
    var view: View! { get set }
    
    /**
     Interactor of the module.
     */
    var interactor: Interactor! { get set }
    
    /**
     Router of the module.
     */
    var router: Router! { get set }
}
