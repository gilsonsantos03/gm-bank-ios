import Cartography
import UIKit

protocol WithdrawViewDelegate: AnyObject {
    func didTapOnWithdrawButton(withdrawAmount: Double)
}

protocol WithdrawViewProtocol: UIView {
    var delegate: WithdrawViewDelegate? { get set }
}

final class WithdrawView: UIView, WithdrawViewProtocol {
    
    weak var delegate: WithdrawViewDelegate?
    
    // MARK: - Properties
    
    private lazy var withdrawTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1.5
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.autocorrectionType = .no
        textField.keyboardType = .decimalPad
        textField.setLeftPaddingPoints(4)
        textField.placeholder = "Insira a quantidade a ser sacada"
        return textField
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
    
    // MARK: - Lifecycle

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Helpers
    
    @objc func didTapOnWithdrawButton() {
        let withdrawAmountText = withdrawTextField.text ?? ""
        let withdrawAmount = NumberFormatter().number(from: withdrawAmountText)?.doubleValue
        delegate?.didTapOnWithdrawButton(withdrawAmount: withdrawAmount ?? 0.0)
    }
    
    // MARK: - Constrains

    private func setup() {
        self.backgroundColor = .black
        setupConstrains()
    }
    
    private func setupConstrains() {
        constrainWithdrawTextField()
        constrainButton()
    }
    
    private func constrainWithdrawTextField() {
        addSubview(withdrawTextField)
        constrain(withdrawTextField, self) { withdrawTextField, view in
            withdrawTextField.top == view.top + 300
            withdrawTextField.leading == view.leading + 16
            withdrawTextField.trailing == view.trailing - 16
            withdrawTextField.height == 50
        }
    }

    private func constrainButton() {
        addSubview(withdrawButton)
        constrain(withdrawButton, withdrawTextField) { button, withdrawTextField in
            button.top == withdrawTextField.bottom + 40
            button.leading == withdrawTextField.leading + 70
            button.trailing == withdrawTextField.trailing - 70
            button.height == 50
        }
    }
}
