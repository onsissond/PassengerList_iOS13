//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

extension CellProviderFactory where ViewState == PassengerCell.ViewState {
    static let passenger = CellProviderFactory { collectionView in
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
