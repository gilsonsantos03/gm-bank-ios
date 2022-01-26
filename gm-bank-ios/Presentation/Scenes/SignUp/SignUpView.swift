import Cartography
import UIKit

protocol SignUpViewDelegate: AnyObject {
    func didTapOnRegisterButton(name: String, email: String, password: String)
    func didTapOnLoginButton()
}

protocol SignUpViewProtocol: UIView {
    var delegate: SignUpViewDelegate? { get set }
}

final class SignUpView: UIView, SignUpViewProtocol {
    
    weak var delegate: SignUpViewDelegate?
    
    // MARK: - Properties
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1.5
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.placeholder = "Insira seu nome"
        return textField
    }()
    
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
        textField.placeholder = "Insira sua senha (precisa ter mais de 6 dígitos)"
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.backgroundColor = .white
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.backgroundColor = .white
        button.setTitle("Já tenho conta", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
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
    
    @objc func didTapRegisterButton() {
        delegate?.didTapOnRegisterButton(name: nameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @objc func didTapLoginButton() {
        delegate?.didTapOnLoginButton()
    }
    
    // MARK: - Constrains

    private func setup() {
        self.backgroundColor = .black
        setupConstrains()
    }
    
    private func setupConstrains() {
        constrainNameTextField()
        constrainEmailTextField()
        constrainPasswordTextField()
        constrainRegisterButton()
        constrainLoginButton()
    }
    
    private func constrainNameTextField() {
        addSubview(nameTextField)
        constrain(nameTextField, self) { nameTextField, view in
            nameTextField.leading == view.leading + 16
            nameTextField.top == view.top + 300
            nameTextField.trailing == view.trailing - 16
            nameTextField.height == 50
        }
    }
    
    private func constrainEmailTextField() {
        addSubview(emailTextField)
        constrain(emailTextField, nameTextField) { emailTextField, nameTextField in
            emailTextField.top == nameTextField.bottom + 20
            emailTextField.leading == nameTextField.leading
            emailTextField.trailing == nameTextField.trailing
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
    
    private func constrainRegisterButton() {
        addSubview(registerButton)
        constrain(registerButton, passwordTextField) { button, passwordTextField in
            button.top == passwordTextField.bottom + 40
            button.leading == passwordTextField.leading + 70
            button.trailing == passwordTextField.trailing - 70
            button.height == 50
        }
    }
    
    private func constrainLoginButton() {
        addSubview(loginButton)
        constrain(loginButton, registerButton) { button, registerButton in
            button.top == registerButton.bottom + 20
            button.leading == registerButton.leading
            button.trailing == registerButton.trailing
            button.height == 50
        }
    }
}
