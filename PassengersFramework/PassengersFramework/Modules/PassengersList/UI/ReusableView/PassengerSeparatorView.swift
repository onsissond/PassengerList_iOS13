//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

final class PassengerSeparatorView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.separator.color
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
