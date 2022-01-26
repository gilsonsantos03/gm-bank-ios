import UIKit

protocol ExtractDisplayLogic: AnyObject {
    func display(viewModel: ExtractModels.ShowExtract.ViewModel)
}

final class ExtractViewController: UIViewController {

    private let customView: ExtractViewProtocol
    private let router: ExtractRoutingLogic
    private let interactor: ExtractBusinessLogic

    private var transactions: [TransactionCell.ViewModel] = []

    init(view: ExtractViewProtocol = ExtractView(), router: ExtractRoutingLogic, interactor: ExtractBusinessLogic) {
        self.customView = view
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        customView.setTableViewDelegate(self)
        customView.setTableViewDataSource(self)
    }

    required init?(coder: NSCoder) {
        nil
    }

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.showExtract(request: .init())
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Extrato"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26, weight: .bold)
        ]
    }
}

extension ExtractViewController: ExtractDisplayLogic {
    func display(viewModel: ExtractModels.ShowExtract.ViewModel) {
        
    }
}

extension ExtractViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactions.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

extension ExtractViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransactionCell.identifier, for: indexPath) as? TransactionCell else {
            return UITableViewCell()
        }

        let transaction = transactions[indexPath.row]
        cell.configure(with: transaction)

        return cell
    }
}
