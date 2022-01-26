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
    
    private lazy var nameTextView: UITextField = {
        let textView = UITextField()
        textView.layer.cornerRadius = 6
        textView.layer.borderWidth = 1.5
        textView.backgroundColor = .white
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 16)
        textView.autocorrectionType = .no
        textView.placeholder = "Insira seu nome"
        return textView
    }()
    
    private lazy var emailTextView: UITextField = {
        let textView = UITextField()
        textView.layer.cornerRadius = 6
        textView.layer.borderWidth = 1.5
        textView.backgroundColor = .white
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 16)
        textView.autocorrectionType = .no
        textView.placeholder = "Insira seu email"
        return textView
    }()
    
    private lazy var passwordTextView: UITextField = {
        let textView = UITextField()
        textView.layer.cornerRadius = 6
        textView.layer.borderWidth = 1.5
        textView.backgroundColor = .white
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 16)
        textView.autocorrectionType = .no
        textView.placeholder = "Insira sua senha (precisa ter mais de 6 dígitos)"
        return textView
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
        delegate?.didTapOnRegisterButton(name: nameTextView.text ?? "", email: emailTextView.text ?? "", password: passwordTextView.text ?? "")
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
        constrainNameTextView()
        constrainEmailTextView()
        constrainPasswordTextView()
        constrainRegisterButton()
        constrainLoginButton()
    }
    
    private func constrainNameTextView() {
        addSubview(nameTextView)
        constrain(nameTextView, self) { textView, view in
            textView.leading == view.leading + 16
            textView.top == view.top + 300
            textView.trailing == view.trailing - 16
            textView.height == 50
        }
    }
    
    private func constrainEmailTextView() {
        addSubview(emailTextView)
        constrain(emailTextView, nameTextView) { emailTextView, nameTextView in
            emailTextView.top == nameTextView.bottom + 20
            emailTextView.leading == nameTextView.leading
            emailTextView.trailing == nameTextView.trailing
            emailTextView.height == 50
        }
    }
    
    private func constrainPasswordTextView() {
        addSubview(passwordTextView)
        constrain(passwordTextView, emailTextView) { passwordTextView, emailTextView in
            passwordTextView.top == emailTextView.bottom + 20
            passwordTextView.leading == emailTextView.leading
            passwordTextView.trailing == emailTextView.trailing
            passwordTextView.height == 50
        }
    }
    
    private func constrainRegisterButton() {
        addSubview(registerButton)
        constrain(registerButton, passwordTextView) { button, textView in
            button.top == textView.bottom + 40
            button.leading == textView.leading + 70
            button.trailing == textView.trailing - 70
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
