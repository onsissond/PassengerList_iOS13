//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

protocol PassengersCellProvider {
    func make(
        for collectionView: UICollectionView
    ) -> PassengerDataSource.CellProvider
}
