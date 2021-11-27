//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit
import Core

final class PassengersViewController: UIViewController {

    private var _passengersView = PassengersView()
    private var _dataSource: PassengerDataSource

    init(dataSourceFactory: DataSourceFactory) {
        self._dataSource = dataSourceFactory(
            _passengersView.collectionView
        )
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = _passengersView
    }
}
