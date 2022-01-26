import Cartography
import UIKit

protocol ExtractViewProtocol: UIView {
    func setTableViewDataSource(_ dataSource: UITableViewDataSource)
    func setTableViewDelegate(_ delegate: UITableViewDelegate)
    func reload()
}

final class ExtractView: UIView {

    // MARK: - Properties

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TransactionCell.self, forCellReuseIdentifier: TransactionCell.identifier)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = .black
        return tableView
    }()

    // MARK: - Lifecycle

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        nil
    }

    // MARK: - Constrains

    private func setup() {
        self.backgroundColor = .black
        addSubview(tableView)
        constrainTableView()
    }

    private func constrainTableView() {
        constrain(tableView, self) { tableView, view in
            tableView.edges == view.edges
        }
    }
}

extension ExtractView: ExtractViewProtocol {
    func setTableViewDataSource(_ dataSource: UITableViewDataSource) {
        tableView.dataSource = dataSource
    }

    func setTableViewDelegate(_ delegate: UITableViewDelegate) {
        tableView.delegate = delegate
    }

    func reload() {
        tableView.reloadData()
    }
}
