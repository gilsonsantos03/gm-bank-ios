import UIKit

protocol SignUpPresentationLogic: AnyObject {}

final class SignUpPresenter {
    var view: SignUpDisplayLogic?
}

extension SignUpPresenter: SignUpPresentationLogic {
    
}
