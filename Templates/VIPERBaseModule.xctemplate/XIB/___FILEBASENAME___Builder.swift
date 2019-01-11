//___FILEHEADER___

import Foundation
import VIPERBase

final class ___VARIABLE_moduleBuilderClass___: ___VARIABLE_baseBuilderProtocol___ {
    typealias View = ___VARIABLE_moduleViewClass___
    typealias Presenter = ___VARIABLE_modulePresenterClass___
    typealias Interactor = ___VARIABLE_moduleInteractorClass___
    typealias Router = ___VARIABLE_moduleRouterClass___
    
    static var viewType: VIPERBaseViewType {
        return .nib(name: "___VARIABLE_moduleViewClass___", bundle: nil)
    }
}

//MARK: - Builder custom methods

extension ___VARIABLE_moduleBuilderClass___ {
    
}