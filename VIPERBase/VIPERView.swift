//
//  VIPERView.swift
//  VIPERBase
//
//  Created by Rafael on 27/08/18.
//  Copyright © 2018 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

/**
 Protocol that defines the **View** layer of VIPER architecture.
 */
public protocol VIPERView: VIPERBaseLayer {
    
    /**
     Type of the presenter in the view layer.
     */
    associatedtype Presenter
    
    /**
     Presenter of the module.
     */
    var presenter: Presenter! { get set }
}
