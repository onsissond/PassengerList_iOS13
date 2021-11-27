//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit
import Core

final class PassengerIconView: UIView {

    private let _emojiView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func _setupSubviews() {
        addSubview(_emojiView) {
            equal(\.topAnchor)
            equal(\.leadingAnchor)
            equal(\.trailingAnchor)
            equal(\.bottomAnchor)
        }
    }
}

extension PassengerIconView {

    enum ViewState {
        case male, female, child, boy, girl, unknown
    }

    func render(_ viewState: ViewState) {
        switch viewState {
        case .male:
            _emojiView.image = Asset.male.image
        case .female:
            _emojiView.image = Asset.female.image
        case .child:
            _emojiView.image = Asset.child.image
        case .boy:
            _emojiView.image = Asset.boy.image
        case .girl:
            _emojiView.image = Asset.girl.image
        case .unknown:
            _emojiView.image = Asset.unknown.image
        }
    }
}
