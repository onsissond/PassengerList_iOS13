//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

protocol PassengersViewProvider {
    typealias DataSource = PassengerDataSource
    typealias Kind = PassengersSupplementaryViewKind

    func make(
        for collectionView: UICollectionView
    ) -> PassengerDataSource.SupplementaryViewProvider
}

protocol ChildPassengersViewProvider: PassengersViewProvider {
    var kind: String { get }
}
