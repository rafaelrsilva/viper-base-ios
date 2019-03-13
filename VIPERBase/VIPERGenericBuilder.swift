//
//  VIPERGenericBuilder.swift
//  VIPERBase
//
//  Created by Rafael on 12/03/19.
//  Copyright © 2019 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

/**
 Use this class to build a customized VIPER module.
 
 In order to use this generic class, you must inform:
 
 - Class type for `View`;
 - Class type for `Presenter`;
 - Class type for `Interactor`;
 - Class type for `Router`;
 
 Usage example below:
 
        let module = VIPERGenericBuilder<ModuleView, ModulePresenter, ModuleInteractor, ModuleRouter>.build()
 
 It you are using storyboard to prototype the UI, use example below:
 
        let module = VIPERGenericBuilder<ModuleView, ModulePresenter, ModuleInteractor, ModuleRouter>.build(viewUIType: .storyboard(name: "ModuleView", bundle: nil))
 
 It you are using XIB file to prototype the UI, use example below:
 
        let module = VIPERGenericBuilder<ModuleView, ModulePresenter, ModuleInteractor, ModuleRouter>.build(viewUIType: .nib(name: "ModuleView", bundle: nil))
 */
public class VIPERGenericBuilder<View: UIViewController & VIPERView, Presenter: VIPERPresenter, Interactor: VIPERInteractor, Router: VIPERRouter>: VIPERBuilder {
    
    public static var viewType: VIPERBaseViewType {
        return .none
    }
    
    private init() {}
}

