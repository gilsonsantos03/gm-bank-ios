import UIKit

protocol SignUpDisplayLogic: AnyObject {
    func displayUser(viewModel: SignUpModels.RegisterUser.ViewModel)
}

final class SignUpController: UIViewController {
        
    private let customView: SignUpViewProtocol
    private let router: SignUpRoutingLogic
    private let interactor: SignUpBusinessLogic
    
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
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension SignUpController: SignUpDisplayLogic {
    func displayUser(viewModel: SignUpModels.RegisterUser.ViewModel) {
        router.routeToAccountScene(authentication: viewModel.authentication)
    }
}

extension SignUpController: SignUpViewDelegate {
    func didTapOnRegisterButton(name: String, email: String, password: String) {
        interactor.registerUser(request: .init(name: name, email: email, password: password))
    }
    
    func didTapOnLoginButton() {
        router.routeToLoginScene()
    }
}
