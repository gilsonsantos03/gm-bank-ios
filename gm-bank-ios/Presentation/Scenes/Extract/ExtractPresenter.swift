import UIKit

protocol ExtractPresentationLogic: AnyObject {
    func presentExtract(response: ExtractModels.ShowExtract.Response)
}

final class ExtractPresenter {
    var view: ExtractDisplayLogic?
}

extension ExtractPresenter: ExtractPresentationLogic {
    func presentExtract(response: ExtractModels.ShowExtract.Response) {
        
    }
}
