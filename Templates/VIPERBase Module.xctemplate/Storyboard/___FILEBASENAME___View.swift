//___FILEHEADER___

import UIKit
import VIPERBase

final class ___VARIABLE_moduleViewClass___: UIViewController, ___VARIABLE_baseViewProtocol___ {

    var basePresenter: ___VARIABLE_basePresenterProtocol___!

}

//MARK: - ___VARIABLE_viewContractName___

extension ___VARIABLE_moduleViewClass___: ___VARIABLE_viewContractName___ {

}

//MARK: - ___VARIABLE_baseViewProtocol___ extension for this module

private extension ___VARIABLE_baseViewProtocol___ where Self: ___VARIABLE_moduleViewClass___ {

    var presenter: ___VARIABLE_viewOutputContractName___! {
        return basePresenter as? ___VARIABLE_viewOutputContractName___
    }
}