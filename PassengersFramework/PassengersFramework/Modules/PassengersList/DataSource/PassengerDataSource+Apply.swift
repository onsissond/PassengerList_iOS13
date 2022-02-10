//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

extension PassengerDataSource {
    func apply(with list: [PassengerDataSourceSection], animate: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections(list.map(\.sectionHeader))
        for element in list {
            snapshot.appendItems(
                element.items,
                toSection: element.sectionHeader
            )
        }
        apply(snapshot, animatingDifferences: animate)
    }
}

extension UICollectionViewDiffableDataSource {
    typealias Snapshot = NSDiffableDataSourceSnapshot<
        SectionIdentifierType, ItemIdentifierType
    >
}
