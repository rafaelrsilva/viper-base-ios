//
//  VIPERModuleEmbedType.swift
//  VIPERBase
//
//  Created by Rafael on 27/08/18.
//  Copyright © 2018 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

/**
 Embed options for the view controller of the module
 */
public enum VIPERModuleEmbedType {
    
    ///Not to embed the created view controller
    case None
    
    ///Embed created view controller in a navigation controller
    case NavigationController
    
    ///Embed created view controller in a tab bar controller
    case TabBarController
}
