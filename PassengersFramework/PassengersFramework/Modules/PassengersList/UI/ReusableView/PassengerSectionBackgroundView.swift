//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit
import Core

final class PassengerSectionBackgroundView: UICollectionReusableView {

    private var _view: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.backgroundSecondary.color
        view.layer.cornerRadius = 12
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: 12).cgPath
        view.layer.shadowColor = UIColor(red: 0.292, green: 0.414, blue: 0.65, alpha: 0.16).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 16
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        _setupSubviews()
    }

    private func _setupSubviews() {
        addSubview(_view) {
            equal(\.topAnchor, constant: 40)
            equal(\.leadingAnchor)
            equal(\.trailingAnchor)
            equal(\.bottomAnchor)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
