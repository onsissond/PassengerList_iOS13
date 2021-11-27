//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

typealias PassengerDataSource = UICollectionViewDiffableDataSource<
    PassengerSectionHeaderView.ViewState,
    PassengerCell.ViewState
>

extension PassengerDataSource {
    convenience init(
        collectionView: UICollectionView
    ) {
        self.init(
            collectionView: collectionView,
            cellProvider: PassengerCellProviderImpl(),
            supplementaryViewProvider: PassengersViewProviderImpl.init
        )
    }

    convenience init(
        collectionView: UICollectionView,
        cellProvider: PassengersCellProvider,
        supplementaryViewProvider: (PassengerDataSource) -> PassengersViewProvider
    ) {
        self.init(
            collectionView: collectionView,
            cellProvider: cellProvider.make(for: collectionView)
        )
        self.supplementaryViewProvider = supplementaryViewProvider(self)
            .make(for: collectionView)
    }
}
