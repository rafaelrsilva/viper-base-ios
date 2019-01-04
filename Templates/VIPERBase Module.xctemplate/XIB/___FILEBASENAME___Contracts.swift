//___FILEHEADER___

import Foundation
import VIPERBase

//MARK: - View Contract

protocol ___VARIABLE_productName___ViewProtocol: class {

}

//MARK: - View Output Contract

protocol ___VARIABLE_productName___ViewOutputProtocol: class {

}

//MARK: - Interactor Contract

protocol ___VARIABLE_productName___InteractorProtocol: class {

}

//MARK: - Interactor Output Contract

protocol ___VARIABLE_productName___InteractorOutputProtocol: class {

}

//MARK: - Router Contract

protocol ___VARIABLE_productName___RouterProtocol: class {

}

//MARK: - VIPERBase protocols extensions for this module

extension VIPERBaseView where Self: ___VARIABLE_productName___View {

    var presenter: ___VARIABLE_productName___ViewOutputProtocol! {
        return basePresenter as? ___VARIABLE_productName___ViewOutputProtocol
    }
}

extension VIPERBaseInteractor where Self: ___VARIABLE_productName___Interactor {

    weak var presenter: ___VARIABLE_productName___InteractorOutputProtocol! {
        return basePresenter as? ___VARIABLE_productName___InteractorOutputProtocol
    }
}

extension VIPERBasePresenter where Self: ___VARIABLE_productName___Presenter {

    weak var view: ___VARIABLE_productName___ViewProtocol! {
        return baseView as? ___VARIABLE_productName___ViewProtocol
    }

    var router: ___VARIABLE_productName___RouterProtocol! {
        return baseRouter as? ___VARIABLE_productName___RouterProtocol
    }

    var interactor: ___VARIABLE_productName___InteractorProtocol! {
        return baseInteractor as? ___VARIABLE_productName___InteractorProtocol
    }
}
