import UIKit

protocol DepositDisplayLogic: AnyObject {
    func displayUserMoney(viewModel: DepositModels.DepositUserMoney.ViewModel)
}

final class DepositViewController: UIViewController {
    
    private let customView: DepositViewProtocol
    private let router: DepositRoutingLogic
    private let interactor: DepositBusinessLogic
    
    init(
        view: DepositViewProtocol = DepositView(),
        router: DepositRoutingLogic,
        interactor: DepositBusinessLogic
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
        navigationItem.title = "Depósito"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26, weight: .bold)
        ]
    }
}

extension DepositViewController: DepositDisplayLogic {
    func displayUserMoney(viewModel: DepositModels.DepositUserMoney.ViewModel) {
        switch viewModel {
        case .success:
            router.routeToPreviousScene()
        case .failure(let error):
            AlertError.showAlert(error: error, viewController: self)
        }
    }
}

extension DepositViewController: DepositViewDelegate {
    func didTapOnDepositButton(depositAmount: Double) {
        interactor.depositUserMoney(request: .init(depositAmount: depositAmount))
    }
}
