//
// Copyright © 2020 LLC "Globus Media". All rights reserved.
//

#if os(iOS)

import UIKit
// swiftlint:disable identifier_name
// swiftlint:disable line_length

// MARK: - Axis констрейнты

/// Функция создания констреинта типа
/// ````
/// childView.{axis}Anchor.constraint(greaterThanOrEqualTo: parentView.{axis}Anchor, constant: constant)
/// ````
/// где, childView anchor != parentView anchor
///
/// - Parameters:
///   - keyPath: child view anchor key path
///   - to: parent view anchor key path
///   - constant: конcтанта
///   - priority: приоритет
/// - Returns: функция Constraint
public func greaterThanOrEqual<Axis, Anchor>(
    _ keyPath: KeyPath<UIView, Anchor>,
    _ to: KeyPath<UIView, Anchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return { child, parent in
        child[keyPath: keyPath]
            .constraint(greaterThanOrEqualTo: parent[keyPath: to], constant: constant)
            .with(priority: priority)
    }
}

/// Функция создания констреинта типа
/// ````
/// childView.{axis}Anchor.constraint(greaterThanOrEqualTo: parentView.{axis}Anchor, constant: constant)
/// ````
/// где, childView anchor == parentView anchor
///
/// - Parameters:
///   - keyPath: общий anchor key path
///   - constant: константа
///   - priority: приоритет
/// - Returns: функция Constraint
public func greaterThanOrEqual<Axis, Anchor>(
    _ keyPath: KeyPath<UIView, Anchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    greaterThanOrEqual(keyPath, keyPath, constant: constant, priority: priority)
}

/// Функция создания констреинта типа
/// ````
/// childView.{axis}Anchor.constraint(greaterThanOrEqualTo: toView.{axis}Anchor, constant: constant)
/// ````
/// где, childView anchor != toView anchor
///
/// - Parameters:
///   - keyPath: child view anchor key path
///   - toView: родительская view
///   - to: parent view anchor key path
///   - constant: константа
///   - priority: приоритет
/// - Returns: функция Constraint
public func greaterThanOrEqual<Axis, Anchor>(
    _ keyPath: KeyPath<UIView, Anchor>,
    to view: UIView,
    _ to: KeyPath<UIView, Anchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return { child, _ in
        child[keyPath: keyPath]
            .constraint(greaterThanOrEqualTo: view[keyPath: to], constant: constant)
            .with(priority: priority)
    }
}

/// Функция создания констреинта типа
/// ````
/// childView.{axis}Anchor.constraint(greaterThanOrEqualTo: toView.{axis}Anchor, constant: constant)
/// ````
/// где, childView anchor == toView anchor
///
/// - Parameters:
///   - keyPath: общий anchor key path
///   - toView: родительская view
///   - constant: константа
///   - priority: приоритет
/// - Returns: функция Constraint
public func greaterThanOrEqual<Axis, Anchor>(
    _ keyPath: KeyPath<UIView, Anchor>,
    to view: UIView,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    greaterThanOrEqual(
        keyPath,
        to: view, keyPath,
        constant: constant,
        priority: priority
    )
}

// MARK: - Dimensions констрейнты

/// Функция создания констреинта типа
/// ````
/// childView.{dimension}Anchor.constraint(greaterThanOrEqualToConstant: constant)
/// ````
///
/// - Parameters:
///   - keyPath: dimension anchor key path
///   - constant: константа
///   - priority: приоритет
/// - Returns: функция Constraint
public func greaterThanOrEqualTo<Dimension>(
    _ keyPath: KeyPath<UIView, Dimension>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
) -> Constraint where Dimension: NSLayoutDimension {
    return { child, _ in
        child[keyPath: keyPath]
            .constraint(greaterThanOrEqualToConstant: constant)
            .with(priority: priority)
    }
}

/// Функция создания констреинта типа
/// ````
/// childView.{dimension}Anchor.constraint(greaterThanOrEqualTo: parentView.{dimension}Anchor,
/// multiplier: multiplier, constant: constant)
/// ````
/// где, childView anchor != parentView anchor
///
/// - Parameters:
///   - keyPath: child view anchor key path
///   - to: parent view anchor key path
///   - multiplier: множитель
///   - constant: константа
///   - priority: приоритет
/// - Returns: функция Constraint
public func greaterThanOrEqualTo<Dimension>(
    _ keyPath: KeyPath<UIView, Dimension>,
    _ to: KeyPath<UIView, Dimension>,
    multiplier: CGFloat = 1,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
) -> Constraint where Dimension: NSLayoutDimension {
    return { child, parent in
        child[keyPath: keyPath]
            .constraint(
                greaterThanOrEqualTo: parent[keyPath: to],
                multiplier: multiplier,
                constant: constant
        ).with(priority: priority)
    }
}

/// Функция создания констреинта типа
/// ````
/// childView.{dimension}Anchor.constraint(greaterThanOrEqualTo: parentView.{dimension}Anchor,
/// multiplier: multiplier, constant: constant)
/// ````
/// где, childView anchor == parentView anchor
///
/// - Parameters:
///   - keyPath: общий anchor key path
///   - multiplier: множитель
///   - constant: константа
///   - priority: приоритет
/// - Returns: функция Constraint
public func greaterThanOrEqualTo<Dimension>(
    _ keyPath: KeyPath<UIView, Dimension>,
    multiplier: CGFloat = 1,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
) -> Constraint where Dimension: NSLayoutDimension {
    greaterThanOrEqualTo(
        keyPath,
        keyPath,
        multiplier: multiplier,
        constant: constant,
        priority: priority
    )
}

/// Функция создания констреинта типа
/// ````
/// childView.{dimension}Anchor.constraint(greaterThanOrEqualTo: toView.{dimension}Anchor,
/// multiplier: multiplier, constant: constant)
/// ````
/// где, childView anchor != toView anchor
///
/// - Parameters:
///   - keyPath: child view anchor key path
///   - toView: родительская view
///   - to: parent view anchor key path
///   - multiplier: множитель
///   - constant: константа
///   - priority: приоритет
/// - Returns: функция Constraint
public func greaterThanOrEqualTo<Dimension>(
    _ keyPath: KeyPath<UIView, Dimension>,
    to view: UIView,
    _ to: KeyPath<UIView, Dimension>,
    multiplier: CGFloat = 1,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
) -> Constraint where Dimension: NSLayoutDimension {
    return { child, _ in
        child[keyPath: keyPath].constraint(
            greaterThanOrEqualTo: view[keyPath: to],
            multiplier: multiplier,
            constant: constant
        ).with(priority: priority)
    }
}

/// Функция создания констреинта типа
/// ````
/// childView.{dimension}Anchor.constraint(greaterThanOrEqualTo: toView.{dimension}Anchor,
/// multiplier: multiplier, constant: constant)
/// ````
/// где, childView anchor == toView anchor
///
/// - Parameters:
///   - keyPath: общий anchor key path
///   - toView: родительская view
///   - multiplier: множитель
///   - constant: константа
///   - priority: приоритет
/// - Returns: функция Constraint
public func greaterThanOrEqualTo<Dimension>(
    _ keyPath: KeyPath<UIView, Dimension>,
    to view: UIView,
    multiplier: CGFloat = 1,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
) -> Constraint where Dimension: NSLayoutDimension {
    greaterThanOrEqualTo(
        keyPath,
        to: view,
        keyPath,
        multiplier: multiplier,
        constant: constant,
        priority: priority
    )
}

#endif
