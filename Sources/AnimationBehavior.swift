//
//  AnimationBehavior.swift
//  SheetPresentation
//
//  Created by Jeff Kelley on 7/23/20.
//  Copyright © 2020 Detroit Labs. All rights reserved.
//

import UIKit

/// A value that represents the behavior to use when animating the appearnce or
/// dismissal of a presented view controller.
public enum AnimationBehavior {

    /// Use the default system animation.
    case system

    /// Animate appearing and dismissing using specific edges of the screen.
    case present(
        edgeForAppearance: ViewEdgeConvertible,
        edgeForDismissal: ViewEdgeConvertible
    )

    /// Animate using a custom animator.
    case custom(UIViewControllerAnimatedTransitioning)

}

extension AnimationBehavior: Equatable {

    public static func == (lhs: AnimationBehavior,
                           rhs: AnimationBehavior) -> Bool {
        switch (lhs, rhs) {
        case (.system, .system):
            return true
        case let (.present(edgeForAppearance: lhsEdgeA,
                           edgeForDismissal: lhsEdgeD),
                  .present(edgeForAppearance: rhsEdgeA,
                           edgeForDismissal: rhsEdgeD)):
            let lhsFixedEdgeA = lhsEdgeA.fixedViewEdge(using: nil)
            let lhsFixedEdgeD = lhsEdgeD.fixedViewEdge(using: nil)
            let rhsFixedEdgeA = rhsEdgeA.fixedViewEdge(using: nil)
            let rhsFixedEdgeD = rhsEdgeD.fixedViewEdge(using: nil)

            return lhsFixedEdgeA == rhsFixedEdgeA &&
                lhsFixedEdgeD == rhsFixedEdgeD

        case let (.custom(lhs), .custom(rhs)):
            return lhs.isEqual(rhs)

        default:
            return false
        }
    }

}
