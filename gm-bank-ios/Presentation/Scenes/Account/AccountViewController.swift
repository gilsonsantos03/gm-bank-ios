import UIKit

protocol AccountDisplayLogic: AnyObject {
    func displayUserBalance(viewModel: AccountModels.GetUserBalance.ViewModel)
}

final class AccountViewController: UIViewController {
    
    private let customView: AccountViewProtocol
    private let router: AccountRoutingLogic
    private let interactor: AccountBusinessLogic
    
    init(
        view: AccountViewProtocol = AccountView(),
        router: AccountRoutingLogic,
        interactor: AccountInteractor
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
        interactor.getUserBalance(request: .init())
    }

    override func loadView() {
        view = customView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Conta"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26, weight: .bold)
        ]
    }
}

extension AccountViewController: AccountDisplayLogic {
    func displayUserBalance(viewModel: AccountModels.GetUserBalance.ViewModel) {
        customView.display(.init(balance: String(format: "%.1f", viewModel.userBalance.balance)))
    }
}
