//
// Copyright © 2018 LLC "Globus Media". All rights reserved.
//

#if os(iOS)

import UIKit

extension NSLayoutConstraint {
    func with(priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}

#endif
