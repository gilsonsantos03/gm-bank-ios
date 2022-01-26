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
        textView.placeholder = "Insira sua senha"
        return textView
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
        delegate?.didTapOnButton(email: emailTextView.text ?? "", password: passwordTextView.text ?? "")
    }
    
    // MARK: - Constrains

    private func setup() {
        self.backgroundColor = .black
        setupConstrains()
    }
    
    private func setupConstrains() {
        constrainEmailTextView()
        constrainPasswordTextView()
        constrainButton()
    }
    
    private func constrainEmailTextView() {
        addSubview(emailTextView)
        constrain(emailTextView, self) { emailTextView, view in
            emailTextView.top == view.top + 300
            emailTextView.leading == view.leading + 16
            emailTextView.trailing == view.trailing - 16
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
    
    private func constrainButton() {
        addSubview(button)
        constrain(button, passwordTextView) { button, textView in
            button.top == textView.bottom + 40
            button.leading == textView.leading + 70
            button.trailing == textView.trailing - 70
            button.height == 50
        }
    }
}
