//
//  VIPERBasePresenter.swift
//  VIPERBase
//
//  Created by Rafael on 27/08/18.
//  Copyright © 2018 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

/**
 Protocol that defines the **VIPER presenter** base functionality and specify what must be
 implemented by the application presenters
 */
public protocol VIPERBasePresenter: class {
    
    ///Module view reference
    var view: VIPERBaseView! { get set }
    
    ///Module router reference
    var router: VIPERBaseRouter! { get set }
    
    ///Module interactor reference
    var interactor: VIPERBaseInteractor! { get set }
}
