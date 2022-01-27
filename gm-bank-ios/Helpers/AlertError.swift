import UIKit

public final class AlertError {
    static func showAlert(error: String?, viewController: UIViewController) {
        let dialogMessage = UIAlertController(title: "Algo deu errado:", message: error, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Entendi", style: .default, handler: nil)
        dialogMessage.addAction(ok)
        viewController.present(dialogMessage, animated: true, completion: nil)
    }
}
