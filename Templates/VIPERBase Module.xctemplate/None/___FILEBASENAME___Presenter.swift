//___FILEHEADER___

import Foundation
import VIPERBase

final class ___VARIABLE_modulePresenterClass___: ___VARIABLE_basePresenterProtocol___ {

    weak var baseView: ___VARIABLE_baseViewProtocol___!
    var baseRouter: ___VARIABLE_baseRouterProtocol___!
    var baseInteractor: ___VARIABLE_baseInteractorProtocol___!

}

//MARK: - ___VARIABLE_viewOutputContractName___

extension ___VARIABLE_modulePresenterClass___: ___VARIABLE_viewOutputContractName___ {

}

//MARK: - ___VARIABLE_interactorOutputContractName___

extension ___VARIABLE_modulePresenterClass___: ___VARIABLE_interactorOutputContractName___ {

}

//MARK: - ___VARIABLE_basePresenterProtocol___ extension for this module

private extension ___VARIABLE_basePresenterProtocol___ where Self: ___VARIABLE_modulePresenterClass___ {

    weak var view: ___VARIABLE_viewContractName___! {
        return baseView as? ___VARIABLE_viewContractName___
    }

    var router: ___VARIABLE_routerContractName___! {
        return baseRouter as? ___VARIABLE_routerContractName___
    }

    var interactor: ___VARIABLE_interactorContractName___! {
        return baseInteractor as? ___VARIABLE_interactorContractName___
    }
}