//
// Copyright © 2022 LLC "Globus Media". All rights reserved.
//

enum PassengerDataSourceItem: Hashable {
    case passenger(PassengerCell.ViewState)
}

extension PassengerDataSourceItem {
    var passenger: PassengerCell.ViewState? {
        guard case .passenger(let viewState) = self else {
            return nil
        }
        return viewState
    }
}
