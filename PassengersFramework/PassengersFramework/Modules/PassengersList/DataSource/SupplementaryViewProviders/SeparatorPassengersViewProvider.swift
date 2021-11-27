//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

struct SeparatorPassengersViewProvider: ChildPassengersViewProvider {
    var kind: String { PassengersSupplementaryViewKind.separator }

    func make(
        for collectionView: UICollectionView
    ) -> DataSource.SupplementaryViewProvider {
        collectionView.register(
            class: PassengerSeparatorView.self,
            forSupplementaryViewOfKind: kind
        )
        return { collectionView, kind, indexPath in
            let header: PassengerSeparatorView = collectionView
                .dequeueReusableSupplementaryView(
                    ofKind: kind,
                    for: indexPath
                )
            let itemsInSection = collectionView.numberOfItems(
                inSection: indexPath.section
            )
            header.isHidden = itemsInSection - 1 == indexPath.row
            return header
        }
    }
}
