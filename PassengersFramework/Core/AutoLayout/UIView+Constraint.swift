//
// Copyright © 2020 LLC "Globus Media". All rights reserved.
//

#if os(iOS)

import UIKit

extension UIView {

    /// Добавляет childView с активацией констреинтов
    /// 1. Добавляет childView
    /// 2. отключает translatesAutoresizingMaskIntoConstraints
    /// 3. активирует констраинты из массива [Constraint]
    ///
    /// - Parameters:
    ///   - child: child view
    ///   - constraints: массив функций Constraint
    public func addSubview(_ child: UIView, constraints: [Constraint]) {
        addSubview(child)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(child, self) })
    }
    
    
    public func addSubview(
        _ child: UIView,
        @ArrayBuilder<Constraint> constraints: () -> [Constraint]
    ) {
        addSubview(child, constraints: constraints())
    }

    /// Помещает childView в массив subviews по указанному индексу с активацией констреинтов
    /// 1. Помещает childView
    /// 2. отключает translatesAutoresizingMaskIntoConstraints
    /// 3. активирует констраинты из массива [Constraint]
    ///
    /// - Parameters:
    ///   - child: child view
    ///   - index: индекс в массиве subviews
    ///   - constraints: массив функций Constraint
    public func insertSubview(
        _ child: UIView,
        at index: Int,
        constraints: [Constraint]
    ) {
        insertSubview(child, at: index)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(child, self) })
    }
    
    public func insertSubview(
        _ child: UIView,
        at index: Int,
        @ArrayBuilder<Constraint> constraints: () -> [Constraint]
    ) {
        insertSubview(child, at: index, constraints: constraints())
    }

    /// Помещает childView в массив subviews ниже указанной view с активацией констреинтов
    /// 1. Помещает childView
    /// 2. отключает translatesAutoresizingMaskIntoConstraints
    /// 3. активирует констраинты из массива [Constraint]
    ///
    /// - Parameters:
    ///   - child: child view
    ///   - siblingSubview: view которая будет выше child view
    ///   - constraints: массив функций Constraint
    public func insertSubview(
        _ child: UIView,
        belowSubview siblingSubview: UIView,
        constraints: [Constraint]
    ) {
        insertSubview(child, belowSubview: siblingSubview)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(child, self) })
    }
    
    public func insertSubview(
        _ child: UIView,
        belowSubview siblingSubview: UIView,
        @ArrayBuilder<Constraint> constraints: () -> [Constraint]
    ) {
        insertSubview(child, belowSubview: siblingSubview, constraints: constraints())
    }

    /// Помещает childView в массив subviews выше указанной view с активацией констреинтов
    /// 1. Помещает childView
    /// 2. отключает translatesAutoresizingMaskIntoConstraints
    /// 3. активирует констраинты из массива [Constraint]
    ///
    /// - Parameters:
    ///   - child: child view
    ///   - siblingSubview: view которая будет ниже child view
    ///   - constraints: массив функций Constraint
    public func insertSubview(
        _ child: UIView,
        aboveSubview siblingSubview: UIView,
        constraints: [Constraint]
    ) {
        insertSubview(child, aboveSubview: siblingSubview)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(child, self) })
    }
    
    public func insertSubview(
        _ child: UIView,
        aboveSubview siblingSubview: UIView,
        @ArrayBuilder<Constraint> constraints: () -> [Constraint]
    ) {
        insertSubview(child, aboveSubview: siblingSubview, constraints: constraints())
    }

    public func add(_ constraints: [Constraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(self, self) })
    }
    
    public func add(@ArrayBuilder<Constraint> constraints: () -> [Constraint]) {
        add(constraints())
    }

    public func addConstraint(
        to view: UIView,
        _ constraint: Constraint
    ) -> NSLayoutConstraint {
        return constraint(view, self)
    }
}

#endif
