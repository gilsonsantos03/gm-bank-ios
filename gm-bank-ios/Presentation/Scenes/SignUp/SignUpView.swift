import Cartography
import UIKit

protocol SignUpViewProtocol: UIView {}

final class SignUpView: UIView {
    
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
        self.backgroundColor = .red
    }
}

extension SignUpView: SignUpViewProtocol {}
