//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

public enum PassengersAssembly {
    public static func viewController(
    ) -> UIViewController {
        PassengersViewController(
            dataSourceFactory: PassengerDataSource.mock
        )
    }
}

extension PassengerDataSource {
    static func mock(
        collectionView: UICollectionView
    ) -> PassengerDataSource {
        let dataSource = PassengerDataSource(collectionView: collectionView)
        dataSource.apply(with: .mock)
        return dataSource
    }
}
