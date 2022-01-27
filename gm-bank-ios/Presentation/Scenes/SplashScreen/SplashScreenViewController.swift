import UIKit

final class SplashScreenViewController: UIViewController {
    
    private let customView: SplashScreenViewProtocol
    
    init(view: SplashScreenViewProtocol = SplashScreenView()) {
        self.customView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(pushViewController), userInfo: nil, repeats: false)
    }

    override func loadView() {
        view = customView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Helpers
    
    @objc func pushViewController() {
        let signUpViewController = SignUpConfigurator.resolve()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
}
