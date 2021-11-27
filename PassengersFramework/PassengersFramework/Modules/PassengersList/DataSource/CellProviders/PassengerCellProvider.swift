//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

struct PassengerCellProviderImpl: PassengersCellProvider {
    func make(
        for collectionView: UICollectionView
    ) -> PassengerDataSource.CellProvider {
        collectionView.register(class: PassengerCell.self)
        return { collectionView, indexPath, viewState in
            let cell: PassengerCell = collectionView.dequeueReusableCell(
                for: indexPath
            )
            cell.render(viewState)
            return cell
        }
    }
}
