import Cartography
import UIKit

protocol SignUpViewDelegate: AnyObject {
    func didTapOnButton()
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
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.backgroundColor = .white
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
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
    
    @objc func didTapSubmitButton() {
        delegate?.didTapOnButton()
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
        constrainButton()
    }
    
    private func constrainNameTextView() {
        addSubview(nameTextView)
        constrain(nameTextView, self) { textView, view in
            textView.leading == view.leading + 16
            textView.top == view.top + 100
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
