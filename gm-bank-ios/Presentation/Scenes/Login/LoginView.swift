import Cartography
import UIKit

protocol LoginViewDelegate: AnyObject {
    func didTapOnButton(email: String, password: String)
}

protocol LoginViewProtocol: UIView {
    var delegate: LoginViewDelegate? { get set }
}

final class LoginView: UIView, LoginViewProtocol {
    
    weak var delegate: LoginViewDelegate?
    
    // MARK: - Properties
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1.5
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.setLeftPaddingPoints(4)
        textField.placeholder = "Insira seu email"
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1.5
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.setLeftPaddingPoints(4)
        textField.placeholder = "Insira sua senha"
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.backgroundColor = .white
        button.setTitle("Logar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapOnLoginButton), for: .touchUpInside)
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
    
    @objc func didTapOnLoginButton() {
        delegate?.didTapOnButton(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    // MARK: - Constrains

    private func setup() {
        self.backgroundColor = .black
        setupConstrains()
    }
    
    private func setupConstrains() {
        constrainEmailTextField()
        constrainPasswordTextField()
        constrainButton()
    }
    
    private func constrainEmailTextField() {
        addSubview(emailTextField)
        constrain(emailTextField, self) { emailTextField, view in
            emailTextField.top == view.top + 300
            emailTextField.leading == view.leading + 16
            emailTextField.trailing == view.trailing - 16
            emailTextField.height == 50
        }
    }
    
    private func constrainPasswordTextField() {
        addSubview(passwordTextField)
        constrain(passwordTextField, emailTextField) { passwordTextField, emailTextField in
            passwordTextField.top == emailTextField.bottom + 20
            passwordTextField.leading == emailTextField.leading
            passwordTextField.trailing == emailTextField.trailing
            passwordTextField.height == 50
        }
    }
    
    private func constrainButton() {
        addSubview(button)
        constrain(button, passwordTextField) { button, passwordTextField in
            button.top == passwordTextField.bottom + 40
            button.leading == passwordTextField.leading + 70
            button.trailing == passwordTextField.trailing - 70
            button.height == 50
        }
    }
}
