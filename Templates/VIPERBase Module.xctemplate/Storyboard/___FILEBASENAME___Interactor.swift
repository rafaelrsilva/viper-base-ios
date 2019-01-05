//___FILEHEADER___

import Foundation
import VIPERBase

final class ___VARIABLE_moduleInteractorClass___: ___VARIABLE_baseInteractorProtocol___ {

    weak var basePresenter: ___VARIABLE_basePresenterProtocol___!

}

//MARK: - ___VARIABLE_interactorContractName___

extension ___VARIABLE_moduleInteractorClass___: ___VARIABLE_interactorContractName___ {

}

//MARK: - ___VARIABLE_baseInteractorProtocol___ extension for this module

private extension ___VARIABLE_baseInteractorProtocol___ where Self: ___VARIABLE_moduleInteractorClass___ {

    weak var presenter: ___VARIABLE_interactorOutputContractName___! {
        return basePresenter as? ___VARIABLE_interactorOutputContractName___
    }
}