import UIKit

protocol SignUpBusinessLogic: AnyObject {}

final class SignUpInteractor {
    private let presenter: SignUpPresentationLogic

    init(presenter: SignUpPresentationLogic) {
        self.presenter = presenter
    }
}

extension SignUpInteractor: SignUpBusinessLogic {
    
}
