import UIKit

protocol SignUpDisplayLogic: AnyObject {
}

final class SignUpController: UIViewController {
        
    private let customView: SignUpViewProtocol
    private let router: SignUpRoutingLogic
    private let interactor: SignUpInteractor
    
    init(
        view: SignUpViewProtocol = SignUpView(),
        router: SignUpRoutingLogic,
        interactor: SignUpInteractor
    ) {
        self.customView = view
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }

    override func loadView() {
        view = customView
    }
}

extension SignUpController: SignUpDisplayLogic {
    
}
