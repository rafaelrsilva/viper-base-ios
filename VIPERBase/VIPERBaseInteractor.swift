//
//  VIPERBaseInteractor.swift
//  VIPERBase
//
//  Created by Rafael on 27/08/18.
//  Copyright © 2018 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

/**
 Protocol that defines the **VIPER interactor** base functionality and specify what must be
 implemented by the application interactors
 */
public protocol VIPERBaseInteractor: class {
    
    ///Module presenter reference
    var presenter: VIPERBasePresenter! { get set }
}
