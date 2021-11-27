//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

extension PassengerDataSource {
    typealias Snapshot = NSDiffableDataSourceSnapshot<
        PassengerSectionHeaderView.ViewState,
        PassengerCell.ViewState
    >

    func apply(with list: [DataSourceItem], animate: Bool = true) {
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
