import UIKit

protocol WithdrawDisplayLogic: AnyObject {
    func displayUserMoney(viewModel: WithdrawModels.WithdrawUserMoney.ViewModel)
}

final class WithdrawViewController: UIViewController {
    
    private let customView: WithdrawViewProtocol
    private let router: WithdrawRoutingLogic
    private let interactor: WithdrawBusinessLogic
    
    init(
        view: WithdrawViewProtocol = WithdrawView(),
        router: WithdrawRoutingLogic,
        interactor: WithdrawBusinessLogic
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
        navigationItem.title = "Saque"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26, weight: .bold)
        ]
    }
}

extension WithdrawViewController: WithdrawDisplayLogic {
    func displayUserMoney(viewModel: WithdrawModels.WithdrawUserMoney.ViewModel) {
        router.routeToPreviousScene()
    }
}

extension WithdrawViewController: WithdrawViewDelegate {
    func didTapOnWithdrawButton(withdrawAmount: Double) {
        interactor.withdrawUserMoney(request: .init(withdrawAmount: withdrawAmount))
    }
}
