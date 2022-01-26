import UIKit

protocol ExtractBusinessLogic: AnyObject {
    func showExtract(request: ExtractModels.ShowExtract.Request)
}

final class ExtractInteractor {
    private let presenter: ExtractPresentationLogic

    init(presenter: ExtractPresentationLogic) {
        self.presenter = presenter
    }
}

extension ExtractInteractor: ExtractBusinessLogic {
    func showExtract(request: ExtractModels.ShowExtract.Request) {
    }
}
