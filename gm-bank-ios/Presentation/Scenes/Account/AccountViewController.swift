import UIKit

protocol AccountDisplayLogic: AnyObject {
    func displayUserBalance(viewModel: AccountModels.GetUserBalance.ViewModel)
    func displayDepositScene(viewModel: AccountModels.RouteToDepositScene.ViewModel)
    func displayWithdrawScene(viewModel: AccountModels.RouteToDepositScene.ViewModel)
    func displayExtractScene(viewModel: AccountModels.RouteToExtractScene.ViewModel)
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
    }

    override func loadView() {
        view = customView
        customView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        interactor.getUserBalance(request: .init())
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
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension AccountViewController: AccountDisplayLogic {
    func displayUserBalance(viewModel: AccountModels.GetUserBalance.ViewModel) {
        customView.display(.init(balance: String(format: "%.1f", viewModel.userBalance.balance)))
    }
    
    func displayDepositScene(viewModel: AccountModels.RouteToDepositScene.ViewModel) {
        router.routeToDepositScene(userId: viewModel.userId, token: viewModel.token)
    }
    
    func displayWithdrawScene(viewModel: AccountModels.RouteToDepositScene.ViewModel) {
        router.routeToWithdrawScene(userId: viewModel.userId, token: viewModel.token)
    }
    
    func displayExtractScene(viewModel: AccountModels.RouteToExtractScene.ViewModel) {
        router.routeToExtractScene(userId: viewModel.userId, token: viewModel.token)
    }
}

extension AccountViewController: AccountViewDelegate {
    func didTapOnDepositButton() {
        interactor.routeToDepositScene(request: .init())
    }
    
    func didTapOnWithdrawButton() {
        interactor.routeToWithdrawScene(request: .init())
    }
    
    func didTapOnExtractButton() {
        interactor.routeToExtractScene(request: .init())
    }
}
