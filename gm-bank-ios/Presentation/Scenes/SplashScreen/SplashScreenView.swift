import Cartography
import UIKit

protocol SplashScreenViewProtocol: UIView {}

final class SplashScreenView: UIView, SplashScreenViewProtocol {
    
    // MARK: - Properties
    
    private lazy var appName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "GM Bank"
        return label
    }()
    
    private lazy var appLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bank")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
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
        constrainAppLogo()
        constrainAppName()
        
    }
    
    private func constrainAppLogo() {
        addSubview(appLogo)
        constrain(appLogo, self) { image, view in
            image.centerX == view.centerX
            image.centerY == view.centerY
        }
    }
    
    private func constrainAppName() {
        addSubview(appName)
        constrain(appName, appLogo) { label, image in
            label.top == image.bottom + 10
            label.centerX == image.centerX
        }
    }
}
