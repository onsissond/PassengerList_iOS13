//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit
import Core

final class PassengerCell: UICollectionViewCell {

    private var _emojiIcon = PassengerIconView()

    private var _fullnameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()

    private var _detailLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 1
        label.textColor = Asset.labelSecondary.color
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        _setupSubviews()
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func _setupSubviews() {
        contentView.addSubview(_emojiIcon) {
            equal(\.leadingAnchor, constant: .gridSteps(4))
        }

        contentView.addSubview(_fullnameLabel) {
            equal(\.topAnchor, constant: .gridSteps(4))
            equal(\.centerYAnchor, to: _emojiIcon)
            equal(\.leadingAnchor, to: _emojiIcon, \.trailingAnchor, constant: .gridSteps(2))
            lessThanOrEqual(\.trailingAnchor, constant: .gridSteps(-4))
        }
        contentView.addSubview(_detailLabel) {
            equal(\.topAnchor, to: _fullnameLabel, \.bottomAnchor, constant: .gridSteps(1))
            equal(\.leadingAnchor, to: _fullnameLabel)
            lessThanOrEqual(\.trailingAnchor, constant: .gridSteps(-4))
            equal(\.bottomAnchor, constant: .gridSteps(-3))
        }
    }
}

extension PassengerCell {
    struct ViewState: Hashable {
        let icon: PassengerIconView.ViewState
        let fullName: String
        let age: Int
        let number: String
        let series: String
    }

    func render(_ viewState: ViewState) {
        _emojiIcon.render(viewState.icon)
        _fullnameLabel.text = viewState.fullName
        _detailLabel.text = L10n.PassengerCell.details(
            viewState.age,
            viewState.number,
            viewState.series
        )
    }
}

extension PassengerCell.ViewState {
    static let mock = PassengerCell.ViewState(
        icon: .male,
        fullName: "John",
        age: 12,
        number: "1234",
        series: "1234"
    )
}
