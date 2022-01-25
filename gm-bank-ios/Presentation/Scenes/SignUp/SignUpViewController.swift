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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = customView
        customView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Cadastro"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26, weight: .bold)
        ]
    }
}

extension SignUpController: SignUpDisplayLogic {
    
}

extension SignUpController: SignUpViewDelegate {
    func didTapOnButton() {
        interactor.registerUser(request: .init())
    }
}
