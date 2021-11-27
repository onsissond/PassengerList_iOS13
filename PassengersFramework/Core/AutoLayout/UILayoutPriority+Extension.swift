//
// Copyright © 2019 LLC "Globus Media". All rights reserved.
//

#if os(iOS)
import UIKit

extension UILayoutPriority {
    public static var preHigh: UILayoutPriority {
        UILayoutPriority(UILayoutPriority.defaultHigh.rawValue - 1)
    }

    public static var postHigh: UILayoutPriority {
        UILayoutPriority(UILayoutPriority.defaultHigh.rawValue + 1)
    }
}
#endif
