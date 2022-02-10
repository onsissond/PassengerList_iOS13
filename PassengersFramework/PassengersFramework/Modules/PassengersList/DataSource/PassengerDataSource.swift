//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

typealias PassengerDataSource = UICollectionViewDiffableDataSource<
    PassengerSectionHeaderView.ViewState,
    PassengerDataSourceItem
>

extension PassengerDataSource {
    convenience init(
        collectionView: UICollectionView
    ) {
        self.init(
            collectionView: collectionView,
            cellProvider: CellProviderFactory.composite([
                CellProviderFactory.passenger.pullback(\.passenger)
            ]).make(collectionView),
            supplementaryViewProvider: PassengersViewProviderImpl.init
        )
    }

    convenience init(
        collectionView: UICollectionView,
        cellProvider: @escaping PassengersCellProvider,
        supplementaryViewProvider: (PassengerDataSource) -> PassengersViewProvider
    ) {
        self.init(
            collectionView: collectionView,
            cellProvider: cellProvider
        )
        self.supplementaryViewProvider = supplementaryViewProvider(self)
            .make(for: collectionView)
    }
}
