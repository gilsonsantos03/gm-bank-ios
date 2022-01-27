import Cartography
import UIKit

final class TransactionCell: UITableViewCell {

    static let identifier = "TeamCell"

    struct ViewModel {
        let action: Action
        let amount: Double
        let date: String
    }

    private let backgroundBox: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    private let transactionType: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let transactionDate: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let transactionAmount: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .black
        setup()
    }

    required init?(coder: NSCoder) {
        nil
    }

    private func setup() {
        setupConstraints()
    }

    private func setupConstraints() {
        constrainBackgroundBox()
        constrainTransactionTypeLabel()
        constrainTransactionTypeDate()
        constrainTransactionTypeAmount()
    }

    private func constrainBackgroundBox() {
        addSubview(backgroundBox)
        constrain(backgroundBox, self) { background, view in
            background.top == view.top
            background.leading == view.leading + 16
            background.trailing == view.trailing - 16
            background.bottom == view.bottom - 6
        }
    }
    
    private func constrainTransactionTypeLabel() {
        addSubview(transactionType)
        constrain(transactionType, backgroundBox) { label, background in
            label.top == background.top + 4
            label.leading == background.leading + 16
        }
    }
    
    private func constrainTransactionTypeDate() {
        addSubview(transactionDate)
        constrain(transactionDate, backgroundBox, transactionType) { date, background, type in
            date.centerY == background.centerY
            date.leading == type.leading
        }
    }
    
    private func constrainTransactionTypeAmount() {
        addSubview(transactionAmount)
        constrain(transactionAmount, backgroundBox, transactionDate) { amount, background, date in
            amount.bottom == background.bottom - 4
            amount.leading == date.leading
        }
    }
}

extension TransactionCell {
    func configure(with display: ViewModel) {
        transactionType.text = "Tipo: \(display.action.rawValue)"
        transactionDate.text = "Data: \(display.date)"
        transactionAmount.text = "R$ \(display.amount)"
    }
}
