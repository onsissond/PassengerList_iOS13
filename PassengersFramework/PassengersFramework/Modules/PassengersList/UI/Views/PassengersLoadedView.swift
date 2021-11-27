//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit
import Core

final class PassengersView: UIView {
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: CGRect.zero,
            collectionViewLayout: .passengersLayout
        )
        collectionView.backgroundColor = Asset.backgroundQuaternary.color
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func _setupSubviews() {
        addSubview(collectionView, constraints: .allAnchors)
    }
}
