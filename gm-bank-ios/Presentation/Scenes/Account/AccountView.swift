import Cartography
import UIKit

protocol AccountViewDelegate: AnyObject {}

protocol AccountViewProtocol: UIView {
    func display(_ viewModel: AccountView.ViewModel)
}

final class AccountView: UIView {
    
    struct ViewModel {
        let balance: String
    }
    
    // MARK: - Properties
    
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "OIAOSIOAISOIAS"
        label.textColor = .white
        return label
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
        setupConstrains()
    }
    
    private func setupConstrains() {
        constrainBalanceLabel()
    }
    
    private func constrainBalanceLabel() {
        addSubview(balanceLabel)
        constrain(balanceLabel, self) { label, view in
            label.centerX == view.centerX
            label.centerY == label.centerY
        }
    }
}

extension AccountView: AccountViewProtocol {
    func display(_ viewModel: AccountView.ViewModel) {
        balanceLabel.text = "Saldo: R$ \(viewModel.balance)"
    }
}
