//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

typealias CellProvider<ViewState> = (
    _ collectionView: UICollectionView,
    _ indexPath: IndexPath,
    _ itemIdentifier: ViewState
) -> UICollectionViewCell?

typealias PassengersCellProvider = CellProvider<PassengerDataSourceItem>

struct CellProviderFactory<ViewState> {
    var make: (UICollectionView) -> CellProvider<ViewState>
}

extension CellProviderFactory {
    func pullback<Root>(
        _ f: @escaping (Root) -> ViewState?
    ) -> CellProviderFactory<Root> {
        CellProviderFactory<Root> { collectionView in
            let provider = self.make(collectionView)
            return { collectionView, indexPath, root in
                guard let viewState = f(root) else { return nil }
                return provider(collectionView, indexPath, viewState)
            }
        }
    }
}

extension CellProviderFactory {
    static func composite(
        _ providers: [CellProviderFactory<ViewState>]
    ) -> CellProviderFactory<ViewState> {
        CellProviderFactory { collectionView in
            let providers = providers.map { $0.make(collectionView) }
            return { collectionView, indexPath, viewState in
                providers.compactMap {
                    $0(collectionView, indexPath, viewState)
                }.first
            }
        }
    }
}
