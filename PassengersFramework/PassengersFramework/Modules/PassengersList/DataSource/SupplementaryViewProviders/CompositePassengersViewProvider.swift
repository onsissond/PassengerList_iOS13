//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

struct CompositePassengersViewProvider: PassengersViewProvider {
    private var _providers: [String: PassengersViewProvider]

    init(providers: [ChildPassengersViewProvider]) {
        _providers = Dictionary(grouping: providers, by: { $0.kind })
            .compactMapValues(\.first)
    }

    func make(
        for collectionView: UICollectionView
    ) -> DataSource.SupplementaryViewProvider {
        return { collectionView, kind, indexPath in
            guard let provider = _providers[kind] else {
                fatalError("Unimplemented provider for \(kind)")
            }
            return provider.make(for: collectionView)(
                collectionView, kind, indexPath
            )
        }
    }
}
