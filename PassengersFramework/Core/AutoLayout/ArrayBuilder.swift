//
// Copyright © 2020 LLC "Globus Media". All rights reserved.
//

@resultBuilder
public struct ArrayBuilder<Element> {
    public static func buildOptional(_ component: [Element]?) -> [Element] {
        component ?? []
    }

    public static func buildBlock(_ components: [Element]...) -> [Element] {
            Array(components.joined())
        }

    public static func buildExpression(_ expression: Element) -> [Element] {
        [expression]
    }

    public static func buildBlock(_ events: [Element]) -> [Element] {
        events
    }

    public static func buildEither(first component: [Element]) -> [Element] {
        component
    }

    public static func buildEither(second component: [Element]) -> [Element] {
        component
    }
}

