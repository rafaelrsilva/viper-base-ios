//
//  VIPERViewUIType.swift
//  VIPERBase
//
//  Created by Rafael on 03/01/19.
//  Copyright © 2019 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

/**
 File types for prototyping the UI of the view.
 */
public enum VIPERViewUIType {
    
    /**
     The UI of the View is prototyped in a `.storyboard` file
     
     Arguments for this case:
     
     - **name** : The name of the storyboard file
     - **bundle**: Bundle containing the storyboard file
     */
    case storyboard(name: String, bundle: Bundle?)
    
    /**
     The UI of the View is prototyped in a `.xib` file
     
     Arguments for this case:
     
     - **name** : The name of the xib file
     - **bundle**: Bundle containing the xib file
     */
    case nib(name: String, bundle: Bundle?)
    
    /**
     No file for View UI.
     */
    case none
}
