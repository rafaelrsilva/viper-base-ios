//
//  VIPERBaseViewType.swift
//  VIPERBase
//
//  Created by Rafael on 03/01/19.
//  Copyright © 2019 Rafael Ribeiro da Silva. All rights reserved.
//

import Foundation

public enum VIPERBaseViewType {
    case storyboard(name: String, bundle: Bundle?)
    case nib(name: String, bundle: Bundle?)
    case none
}
