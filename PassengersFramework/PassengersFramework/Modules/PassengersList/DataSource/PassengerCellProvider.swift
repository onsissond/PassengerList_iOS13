//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

var passengerCellProvider: PassengerDataSource.CellProvider = {
    collectionView, indexPath, viewState in
    let cell: PassengerCell = collectionView.dequeueReusableCell(
        for: indexPath
    )
    cell.render(state: viewState)
    return cell
}
