//
//  ChainedConstraints.swift
//  BattleScape
//
//  Created by Lucas C Barros on 2022-10-24.
//  Copyright © 2022 Lucas C Barros. All rights reserved.
//

//TODO: WIP - Implement

import Foundation

//
//  Constraints.swift
//
//  Created by Adriano Paladini on 12/03/20.
//

// swiftlint:disable line_length
// swiftlint:disable file_length
// swiftlint:disable no_extension_access_modifier

import UIKit

    // MARK: - isActive

public extension NSLayoutConstraint {

    func off() {
        isActive = false
    }
    func on() {
        isActive = true
    }
    func toggle() {
        isActive = !isActive
    }
    func remove() {
        firstItem?.removeConstraint(self)
    }
}

    // MARK: - addSubviews

public extension UIView {

    /// Set translatesAutoresizingMaskIntoConstraints into false automatically while adding the subviews
    @discardableResult
    func addSubviews(_ views: [UIView]) -> Self {
        for view in views {
            view.autoResizingOff()
            addSubview(view)
        }
        return self
    }

    @discardableResult
    func autoResizingOff() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}

public extension UIViewController {

    func prepareViewsForLayout(_ views: [UIView]) {
        for view in views {
            view.autoResizingOff()
        }
    }
}

public extension UIView {

    // MARK: - Top, Bottom, Leading, Trailing

    @discardableResult
    func topToBottom(of element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, margin: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: relation, toItem: element, attribute: .bottom, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func bottomToTop(of element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, margin: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: relation, toItem: element, attribute: .top, multiplier: multiplier, constant: -margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func leadingToTrailing(of element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, margin: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: relation, toItem: element, attribute: .trailing, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func trailingToLeading(of element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, margin: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: relation, toItem: element, attribute: .leading, multiplier: multiplier, constant: -margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func topToTop(of element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, margin: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: relation, toItem: element, attribute: .top, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func bottomToBottom(of element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, margin: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: relation, toItem: element, attribute: .bottom, multiplier: multiplier, constant: -margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func leadingToLeading(of element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, margin: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: relation, toItem: element, attribute: .leading, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func trailingToTrailing(of element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, margin: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: relation, toItem: element, attribute: .trailing, multiplier: multiplier, constant: -margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    // MARK: - Width and Height

    @discardableResult
    func widthTo(_ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: relation, toItem: self, attribute: .width, multiplier: 0, constant: constant)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func heightTo(_ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: relation, toItem: self, attribute: .height, multiplier: 0, constant: constant)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }
    
    @discardableResult
    func sizeTo(_ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, isActive: Bool = true) -> Self {
        widthTo(constant, relation: relation, priority: priority, isActive: isActive)
        heightTo(constant, relation: relation, priority: priority, isActive: isActive)
        return self
    }

    @discardableResult
    func widthOf(_ element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, constant: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: relation, toItem: element, attribute: .width, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func heightOf(_ element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, constant: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: relation, toItem: element, attribute: .height, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    // MARK: - Centers

    @discardableResult
    func centerHorizontal(to element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, constant: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: relation, toItem: element, attribute: .centerX, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func centerVertical(to element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, constant: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: relation, toItem: element, attribute: .centerY, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func centerTo(to element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, constant: CGFloat = 0.0, isActive: Bool = true) -> Self {
        centerHorizontal(to: element, relation: relation, multiplier: multiplier, priority: priority, constant: constant, isActive: isActive)
        centerVertical(to: element, relation: relation, multiplier: multiplier, priority: priority, constant: constant, isActive: isActive)
        return self
    }

    // MARK: - Aspect Ratio

    @discardableResult
    func aspectRatio(forHeight: Bool = false, multiplier: CGFloat = 1, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, isActive: Bool = true) -> Self {
        var constraint: NSLayoutConstraint?
        if forHeight {
            constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: relation, toItem: self, attribute: .width, multiplier: multiplier, constant: 0)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: relation, toItem: self, attribute: .height, multiplier: multiplier, constant: 0)
        }
        constraint?.priority = priority
        constraint?.isActive = isActive
        return self
    }
}

    // MARK: - Individual Constraints

public extension UIView {

    func widthConstraint() -> NSLayoutConstraint? {
        constraints.first { $0.firstAttribute == NSLayoutConstraint.Attribute.width }
    }

    func heightConstraint() -> NSLayoutConstraint? {
        constraints.first { $0.firstAttribute == NSLayoutConstraint.Attribute.height }
    }

    func aspectRatioConstraint() -> NSLayoutConstraint? {
        constraints.first { $0.firstAttribute == NSLayoutConstraint.Attribute.height && $0.secondAttribute == NSLayoutConstraint.Attribute.width || $0.firstAttribute == NSLayoutConstraint.Attribute.width && $0.secondAttribute == NSLayoutConstraint.Attribute.height }
    }

    func topConstraint() -> NSLayoutConstraint? {
        if let constraints = superview?.constraints {
            for constraint in constraints where itemMatch(constraint: constraint, layoutAttribute: NSLayoutConstraint.Attribute.top) {
                return constraint
            }
        }
        return nil
    }

    func bottomConstraint() -> NSLayoutConstraint? {
        if let constraints = superview?.constraints {
            for constraint in constraints where itemMatch(constraint: constraint, layoutAttribute: NSLayoutConstraint.Attribute.bottom) {
                return constraint
            }
        }
        return nil
    }

    func leadingConstraint() -> NSLayoutConstraint? {
        if let constraints = superview?.constraints {
            for constraint in constraints where itemMatch(constraint: constraint, layoutAttribute: NSLayoutConstraint.Attribute.leading) {
                return constraint
            }
        }
        return nil
    }

    func trailingConstraint() -> NSLayoutConstraint? {
        if let constraints = superview?.constraints {
            for constraint in constraints where itemMatch(constraint: constraint, layoutAttribute: NSLayoutConstraint.Attribute.trailing) {
                return constraint
            }
        }
        return nil
    }

    private func itemMatch(constraint: NSLayoutConstraint, layoutAttribute: NSLayoutConstraint.Attribute) -> Bool {
        if let firstItem = constraint.firstItem as? UIView, let secondItem = constraint.secondItem as? UIView {
            let firstItemMatch = firstItem == self && constraint.firstAttribute == layoutAttribute
            let secondItemMatch = secondItem == self && constraint.secondAttribute == layoutAttribute
            return firstItemMatch || secondItemMatch
        }
        return false
    }
}

    // MARK: - Hugging and Compression

public extension UIView {

    @discardableResult
    func setHugging(_ priority: UILayoutPriority = .required, for axis: NSLayoutConstraint.Axis) -> Self {
        setContentHuggingPriority(priority, for: axis)
        return self
    }

    @discardableResult
    func setCompressionResistance(_ priority: UILayoutPriority = .required, for axis: NSLayoutConstraint.Axis) -> Self {
        setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
}

    // MARK: - Superview

public extension UIView {

    // MARK: - Width and Height Superview

    @discardableResult
    func widthToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
         let anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: relation, toItem: anchor, attribute: .width, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func heightToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        let anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: relation, toItem: anchor, attribute: .height, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }
    
    @discardableResult
    func sizeToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        widthToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        heightToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        return self
    }

    // MARK: - Top, Bottom, Leading, Trailing Superview

    @discardableResult
    func topToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        let anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        let constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: relation, toItem: anchor, attribute: .top, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func bottomToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        let anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        let constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: relation, toItem: anchor, attribute: .bottom, multiplier: multiplier, constant: -margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func leadingToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        let anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        let constraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: relation, toItem: anchor, attribute: .leading, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func trailingToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        let anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        let constraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: relation, toItem: anchor, attribute: .trailing, multiplier: multiplier, constant: -margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    // MARK: - Centers Superview

    @discardableResult
    func centerHorizontalToSuperView(relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, constant: CGFloat = 0.0, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        let anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        let constraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: relation, toItem: anchor, attribute: .centerX, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func centerVerticalToSuperView(relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, constant: CGFloat = 0.0, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        let anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        let constraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: relation, toItem: anchor, attribute: .centerY, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func centerToSuperview(relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, constant: CGFloat = 0.0, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        centerHorizontalToSuperView(relation: relation, multiplier: multiplier, priority: priority, constant: constant, toSafeArea: toSafeArea, isActive: isActive)
        centerVerticalToSuperView(relation: relation, multiplier: multiplier, priority: priority, constant: constant, toSafeArea: toSafeArea, isActive: isActive)
        return self
    }

    // MARK: - Axis Superview

    @discardableResult
    func verticalToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        topToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        bottomToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        return self
    }

    @discardableResult
    func horizontalToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        leadingToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        trailingToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        return self
    }

    // MARK: - Egdes Superview

    struct LayoutEdge: OptionSet {
        public let rawValue: UInt8

        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }

        public static let top = LayoutEdge(rawValue: 1)
        public static let bottom = LayoutEdge(rawValue: 1 << 1)
        public static let trailing = LayoutEdge(rawValue: 1 << 2)
        public static let leading = LayoutEdge(rawValue: 1 << 3)
        public static let none = LayoutEdge(rawValue: 1 << 4)
    }

    @discardableResult
    func edgesToSuperView(excluding: LayoutEdge = .none, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, margin: CGFloat = 0.0, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        if !excluding.contains(.leading) {
            leadingToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        }
        if !excluding.contains(.trailing) {
            trailingToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        }
        if !excluding.contains(.top) {
            topToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        }
        if !excluding.contains(.bottom) {
            bottomToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        }
        return self
    }

    @discardableResult
    func edgesToSuperView(excluding: LayoutEdge = .none, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, margin: UIEdgeInsets, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        if !excluding.contains(.leading) {
            leadingToSuperview(margin.left, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        }
        if !excluding.contains(.trailing) {
            trailingToSuperview(margin.right, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        }
        if !excluding.contains(.top) {
            topToSuperview(margin.top, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        }
        if !excluding.contains(.bottom) {
            bottomToSuperview(margin.bottom, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        }
        return self
    }
}

// swiftlint:enable line_length
// swiftlint:enable no_extension_access_modifier
// swiftlint:enable file_length
