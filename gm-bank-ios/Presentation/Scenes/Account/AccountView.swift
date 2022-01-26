import Cartography
import UIKit

protocol AccountViewDelegate: AnyObject {
    func didTapOnDepositButton()
    func didTapOnWithdrawButton()
    func didTapOnExtractButton()
}

protocol AccountViewProtocol: UIView {
    var delegate: AccountViewDelegate? { get set }
    func display(_ viewModel: AccountView.ViewModel)
}

final class AccountView: UIView {
    
    weak var delegate: AccountViewDelegate?
    
    struct ViewModel {
        let balance: String
    }
    
    // MARK: - Properties
    
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var depositButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.backgroundColor = .white
        button.setTitle("Depositar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapOnDepositButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var withdrawButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.backgroundColor = .white
        button.setTitle("Sacar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapOnWithdrawButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var extractButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.backgroundColor = .white
        button.setTitle("Extrato", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapOnExtractButton), for: .touchUpInside)
        return button
    }()
    
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 6
        return stack
    }()
    
    // MARK: - Lifecycle

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Helpers
    
    @objc func didTapOnDepositButton() {
        delegate?.didTapOnDepositButton()
    }
    
    @objc func didTapOnWithdrawButton() {
        delegate?.didTapOnWithdrawButton()
    }
    
    @objc func didTapOnExtractButton() {
        delegate?.didTapOnExtractButton()
    }
    
    // MARK: - Constrains

    private func setup() {
        self.backgroundColor = .black
        setupConstrains()
    }
    
    private func setupConstrains() {
        constrainBalanceLabel()
        constrainButtonStack()
    }
    
    private func constrainBalanceLabel() {
        addSubview(balanceLabel)
        constrain(balanceLabel, self) { label, view in
            label.center == view.center
        }
    }
    
    private func constrainButtonStack() {
        addSubview(buttonStack)
        buttonStack.addArrangedSubview(depositButton)
        buttonStack.addArrangedSubview(withdrawButton)
        buttonStack.addArrangedSubview(extractButton)
        constrain(buttonStack, balanceLabel, depositButton, withdrawButton, extractButton) { stack, label, depositButton, withdrawButton, extractButton in
            stack.top == label.bottom + 20
            stack.centerX == label.centerX
            depositButton.height == 50
            depositButton.width == 100
            withdrawButton.height == 50
            withdrawButton.width == 100
            extractButton.height == 50
            extractButton.width == 100
        }
    }
}

extension AccountView: AccountViewProtocol {
    func display(_ viewModel: AccountView.ViewModel) {
        balanceLabel.text = "Saldo: R$ \(viewModel.balance)"
    }
}
