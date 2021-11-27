//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

struct PassengersViewProviderImpl: PassengersViewProvider {
    private let _dataSource: DataSource

    init(dataSource: DataSource) {
        _dataSource = dataSource
    }

    func make(
        for collectionView: UICollectionView
    ) -> DataSource.SupplementaryViewProvider {
        let providers: [ChildPassengersViewProvider] = [
            HeaderPassengersViewProvider(
                dataSource: _dataSource
            ),
            SeparatorPassengersViewProvider()
        ]
        return CompositePassengersViewProvider(
            providers: providers
        ).make(for: collectionView)
    }
}
