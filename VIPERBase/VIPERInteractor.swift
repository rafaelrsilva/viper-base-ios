//
//  VIPERInteractor.swift
//  VIPERBase
//
//  Created by Rafael on 27/08/18.
//  Copyright © 2018 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

/**
 Protocol that defines the **Interactor** layer of VIPER architecture.
 */
public protocol VIPERInteractor: VIPERBaseLayer {
    
    /**
     Type of the presenter in the interactor layer.
     */
    associatedtype Presenter
    
    /**
     Presenter of the module.
     */
    var presenter: Presenter! { get set }
}
