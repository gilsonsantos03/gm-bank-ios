import UIKit

protocol ExtractPresentationLogic: AnyObject {
    func presentExtract(response: ExtractModels.ShowExtract.Response)
}

final class ExtractPresenter {
    var view: ExtractDisplayLogic?
}

extension ExtractPresenter: ExtractPresentationLogic {
    func presentExtract(response: ExtractModels.ShowExtract.Response) {
        let viewModel = response.extract.map { extract in
            TransactionCell.ViewModel(action: extract.action, amount: extract.amount, date: extract.date)
        }
        
        view?.display(viewModel: .init(transactions: viewModel))
    }
}
