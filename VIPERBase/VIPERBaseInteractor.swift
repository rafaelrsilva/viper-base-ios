//
//  VIPERBaseInteractor.swift
//  VIPERBase
//
//  Created by Rafael on 27/08/18.
//  Copyright © 2018 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

/**
 Protocol that defines the **VIPER interactor layer** base functionality and specify what must be implemented by the application interactors
 */
public protocol VIPERBaseInteractor: class {
    
    /**
     Module base presenter reference
     
     - Important:
     To access **presenter** methods defined in the module contracts, is needed to force a **downcast to the respective protocol**
     
     The best way to achieve this is declaring a non-stored property.
     
         var presenter: ModuleInteractorOutputProtocol {
            return basePresenter as! ModuleInteractorOutputProtocol
         }
     */
    var basePresenter: VIPERBasePresenter! { get set }
}
