import Cartography
import UIKit

protocol DepositViewDelegate: AnyObject {
    func didTapOnDepositButton(depositAmount: Double)
}

protocol DepositViewProtocol: UIView {
    var delegate: DepositViewDelegate? { get set }
}

final class DepositView: UIView, DepositViewProtocol {
    
    weak var delegate: DepositViewDelegate?
    
    // MARK: - Properties
    
    private lazy var depositTextField: UITextField = {
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
        textField.placeholder = "Insira a quantidade a ser depositada"
        return textField
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
        let depositAmountText = depositTextField.text ?? ""
        let depositAmount = NumberFormatter().number(from: depositAmountText)?.doubleValue
        delegate?.didTapOnDepositButton(depositAmount: depositAmount ?? 0.0)
    }
    
    // MARK: - Constrains

    private func setup() {
        self.backgroundColor = .black
        setupConstrains()
    }
    
    private func setupConstrains() {
        constrainDepositTextField()
        constrainButton()
    }
    
    private func constrainDepositTextField() {
        addSubview(depositTextField)
        constrain(depositTextField, self) { depositTextField, view in
            depositTextField.top == view.top + 300
            depositTextField.leading == view.leading + 16
            depositTextField.trailing == view.trailing - 16
            depositTextField.height == 50
        }
    }

    private func constrainButton() {
        addSubview(depositButton)
        constrain(depositButton, depositTextField) { button, depositTextField in
            button.top == depositTextField.bottom + 40
            button.leading == depositTextField.leading + 70
            button.trailing == depositTextField.trailing - 70
            button.height == 50
        }
    }
}
