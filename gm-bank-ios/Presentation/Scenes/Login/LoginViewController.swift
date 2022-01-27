import UIKit

protocol LoginDisplayLogic: AnyObject {
    func displayUser(viewModel: LoginModels.LoginUser.ViewModel)
}

final class LoginController: UIViewController {
        
    private let customView: LoginViewProtocol
    private let router: LoginRoutingLogic
    private let interactor: LoginBusinessLogic
    
    init(
        view: LoginViewProtocol = LoginView(),
        router: LoginRoutingLogic,
        interactor: LoginInteractor
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
        navigationItem.title = "Login"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26, weight: .bold)
        ]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension LoginController: LoginDisplayLogic {
    func displayUser(viewModel: LoginModels.LoginUser.ViewModel) {
        switch viewModel {
        case .success(let authentication):
            router.routeToAccountScene(authentication: authentication)
        case .failure(let error):
            AlertError.showAlert(error: error, viewController: self)
        }
    }
}

extension LoginController: LoginViewDelegate {
    func didTapOnButton(email: String, password: String) {
        interactor.loginUser(request: .init(email: email, password: password))
    }
}
