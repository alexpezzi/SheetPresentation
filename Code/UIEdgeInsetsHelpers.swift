//
//  UIEdgeInsetsHelpers.swift
//  BottomSheetPresentation
//
//  Created by Jeff Kelley on 5/10/19.
//  Copyright © 2019 Detroit Labs. All rights reserved.
//

import UIKit

extension UIEdgeInsets {

    /// Initializes a `UIEdgeInsets` with a constant value for `top`, `left`,
    /// `bottom`, and `right`.
    ///
    /// - Parameter constant: The constant value to use for all four dimensions.
    public init(constant: CGFloat) {
        self.init(top: constant,
                  left: constant,
                  bottom: constant,
                  right: constant)
    }

    /// Forms a union with the given edge insets. Each value in the insets will
    /// be the larger of the two values.
    ///
    /// - Parameter otherInsets: The other insets with which to form a union.
    public mutating func formUnion(with otherInsets: UIEdgeInsets) {
        top = max(top, otherInsets.top)
        left = max(left, otherInsets.left)
        bottom = max(bottom, otherInsets.bottom)
        right = max(right, otherInsets.right)
    }

}
