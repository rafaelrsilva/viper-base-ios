//
//  VIPERBasePresenter.swift
//  VIPERBase
//
//  Created by Rafael on 27/08/18.
//  Copyright © 2018 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

/**
 Protocol that defines the **VIPER presenter layer** base functionality and specify what must be implemented by the application presenters
 */
public protocol VIPERBasePresenter: class {
    
    /**
     Module base view reference
     
     - Important:
     To access **view** methods defined in the module contracts, is needed to force a **downcast to the respective protocol**.
     
     The best way to achieve this is declaring a non-stored property.
     
     See example below:
     
         var view: ModuleViewProtocol {
            return baseView as! ModuleViewProtocol
         }
     */
    var baseView: VIPERBaseView! { get set }
    
    /**
     Module base router reference
     
     - Important:
     To access **router** methods defined in the module contracts, is needed to force a **downcast to the respective protocol**.
     
     The best way to achieve this is declaring a non-stored property.
     
     See example below:
     
         var router: ModuleRouterProtocol {
            return baseRouter as! ModuleRouterProtocol
         }
     */
    var baseRouter: VIPERBaseRouter! { get set }
    
    /**
     Module base interactor reference
     
     - Important:
     To access **interactor** methods defined in the module contracts, is needed to force a **downcast to the respective protocol**.
     
     The best way to achieve this is declaring a non-stored property.
     
     See example below:
     
         var interactor: ModuleInteractorProtocol {
            return baseInteractor as! ModuleInteractorProtocol
         }
     */
    var baseInteractor: VIPERBaseInteractor! { get set }
}
