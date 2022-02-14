//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

final class PassengerSectionBackgroundView: UICollectionReusableView {
    private var _shapeLayer: CAShapeLayer = {
        $0.fillColor = Asset.backgroundSecondary.color.cgColor
        $0.shadowColor = UIColor(
            red: 0.292,
            green: 0.414,
            blue: 0.65,
            alpha: 0.16
        ).cgColor
        $0.shadowOffset = CGSize(width: 0, height: 4)
        $0.shadowOpacity = 1
        $0.shadowRadius = 12
        return $0
    }(CAShapeLayer())

    private var _view = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        _setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        _shapeLayer.path = UIBezierPath(
            roundedRect: _view.bounds,
            cornerRadius: _shapeLayer.shadowRadius
        ).cgPath
        _shapeLayer.shadowPath = _shapeLayer.path
    }

    private func _setupSubviews() {
        addSubview(_view, constraints: .allAnchors)
        _view.layer.addSublayer(_shapeLayer)
    }
}
