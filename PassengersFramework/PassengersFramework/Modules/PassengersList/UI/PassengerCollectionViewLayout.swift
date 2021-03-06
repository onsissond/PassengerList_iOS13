//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit
import Core

extension UICollectionViewLayout {
    static var passengersLayout: UICollectionViewLayout {
        let item = _makeItem()
        let group = _makeGroup(for: item)
        let section = _makeSection(for: group)
        let layout = _makeLayout(for: section)
        return layout
    }

    private static func _makeItem() -> NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: NSCollectionLayoutDimension.estimated(44)
        )
        return NSCollectionLayoutItem(
            layoutSize: itemSize,
            supplementaryItems: [.separator]
        )
    }

    private static func _makeGroup(
        for item: NSCollectionLayoutItem
    ) -> NSCollectionLayoutGroup {
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(100)
        )
        return NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize, subitems: [item]
        )
    }

    private static func _makeSection(
        for group: NSCollectionLayoutGroup
    ) -> NSCollectionLayoutSection {
        let headerHeight: CGFloat = 40
        let section = NSCollectionLayoutSection(group: group)
        let item = NSCollectionLayoutDecorationItem
            .background(
                elementKind: PassengersSupplementaryViewKind
                    .background
            )
        item.contentInsets.top = headerHeight
        section.boundarySupplementaryItems = [
            .header(height: headerHeight)
        ]
        section.decorationItems = [item]
        return section
    }

    private static func _makeLayout(
        for section: NSCollectionLayoutSection
    ) -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout(
            section: section
        )
        layout.register(
            PassengerSectionBackgroundView.self,
            forDecorationViewOfKind: PassengersSupplementaryViewKind
                .background
        )
        return layout
    }
}

private extension NSCollectionLayoutSupplementaryItem {
    static var separator: NSCollectionLayoutSupplementaryItem {
        let anchor = NSCollectionLayoutAnchor(edges: [.bottom])
        let size = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(1)
        )
        let separator = NSCollectionLayoutSupplementaryItem(
            layoutSize: size,
            elementKind: PassengersSupplementaryViewKind.separator,
            containerAnchor: anchor
        )
        return separator
    }
}

private extension NSCollectionLayoutBoundarySupplementaryItem {
    static func header(
        height: CGFloat
    ) -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(height)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: PassengersSupplementaryViewKind.header,
            alignment: .top
        )
        return sectionHeader
    }
}
