//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

struct HeaderPassengersViewProvider: ChildPassengersViewProvider {
    private let _dataSource: DataSource

    var kind: String { Kind.header }

    init(dataSource: DataSource) {
        _dataSource = dataSource
    }

    func make(
        for collectionView: UICollectionView
    ) -> DataSource.SupplementaryViewProvider {
        collectionView.register(
            class: PassengerSectionHeaderView.self,
            forSupplementaryViewOfKind: kind
        )
        return { collectionView, kind, indexPath in
            let header: PassengerSectionHeaderView = collectionView
                .dequeueReusableSupplementaryView(
                    ofKind: kind,
                    for: indexPath
                )
            let viewState = _dataSource.snapshot()
                .sectionIdentifiers[indexPath.section]
            header.render(viewState)
            return header
        }
    }
}
