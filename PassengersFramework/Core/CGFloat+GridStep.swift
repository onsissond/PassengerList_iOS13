//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit

extension CGFloat {
    public static func gridSteps(_ steps: Int) -> CGFloat {
        gridStep * CGFloat(steps)
    }

    public static var gridStep: CGFloat { 4 }
}
