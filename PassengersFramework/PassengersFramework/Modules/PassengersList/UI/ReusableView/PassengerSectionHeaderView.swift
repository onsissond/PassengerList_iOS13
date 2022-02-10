//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit
import Core

final class PassengerSectionHeaderView: UICollectionReusableView {
    private let _label: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = Asset.labelSecondary.color
        label.numberOfLines = 1
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupSubview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func _setupSubview() {
        addSubview(_label) {
            equal(\.topAnchor, constant: .gridSteps(4))
            equal(\.leftAnchor, constant: .gridSteps(3))
            equal(\.rightAnchor, constant: .gridSteps(-3))
            equal(\.bottomAnchor, constant: .gridSteps(-1))
        }
    }
}

extension PassengerSectionHeaderView {
    enum ViewState: CaseIterable {
        case russianPassport
        case russianTravelPassport
        case russianBirthCertificate
        case nonRussianDocument
        case russianMilitary
        case idSeamanPassport
    }

    func render(_ viewState: ViewState) {
        _label.text = viewState.description
    }
}

private extension PassengerSectionHeaderView.ViewState {
    var description: String {
        typealias Strings = L10n.TitleForHeaderInSection
        switch self {
        case .russianPassport:
            return Strings.russianPassport
        case .russianTravelPassport:
            return Strings.russianTravelPassport
        case .russianBirthCertificate:
            return Strings.russianBirthCertificate
        case .nonRussianDocument:
            return Strings.nonRussianDocument
        case .russianMilitary:
            return Strings.russianMilitary
        case .idSeamanPassport:
            return Strings.idSeamanPassport
        }
    }
}
