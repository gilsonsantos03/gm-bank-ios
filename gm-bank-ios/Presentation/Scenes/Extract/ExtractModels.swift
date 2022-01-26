import Foundation

enum ExtractModels {

    enum ShowExtract {
        struct Request {}

        struct Response {
            let transactionHistory: [TransactionHistory]
        }

        struct ViewModel {
            let transactions: [TransactionCell.ViewModel]
        }
    }
}
