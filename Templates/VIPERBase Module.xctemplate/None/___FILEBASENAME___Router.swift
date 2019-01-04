//___FILEHEADER___

import Foundation
import VIPERBase

class ___VARIABLE_productName___Router: VIPERBaseRouter {

    internal var viewController: UIViewController!
    
    static func createView() -> VIPERBaseView {
        //You must return an instance of view that conforms with VIPERBaseView protocol
    }

    static func createPresenter() -> VIPERBasePresenter {
        return ___VARIABLE_productName___Presenter()
    }

    static func createInteractor() -> VIPERBaseInteractor {
        return ___VARIABLE_productName___Interactor()
    }

    static func createRouter() -> VIPERBaseRouter {
        return ___VARIABLE_productName___Router()
    }

}

//MARK: - ___VARIABLE_productName___RouterProtocol

extension ___VARIABLE_productName___Router: ___VARIABLE_productName___RouterProtocol {

}
