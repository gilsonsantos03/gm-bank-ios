import Foundation

enum ExtractModels {

    enum ShowExtract {
        struct Request {}

        struct Response {
            let extract: [Extract]
        }

        struct ViewModel {
            let transactions: [TransactionCell.ViewModel]
        }
    }
}
