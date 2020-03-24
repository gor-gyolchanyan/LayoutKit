//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

// Type: LayoutConstraint

public struct LayoutConstraint<RegionName, DistanceName>
where RegionName: LayoutRegionName, DistanceName: LayoutDistanceName {

    // Exposed

    // Topic: Main

    public init(_ interval: Interval, is relation: LayoutRelation, to variant: Variant) {
        self.interval = interval
        self.relation = relation
        self.variant = variant
    }

    public var interval: Interval

    public var relation: LayoutRelation

    public var variant: Variant
}

extension LayoutConstraint {

    // Exposed

    // Topic: Main

    public typealias Interval = LayoutInterval<RegionName>
}

// Type: LayoutInterval

extension LayoutInterval {

    // Exposed

    // Topic: LayoutConstraint

    public typealias Constraint<DistanceName> = LayoutConstraint<RegionName, DistanceName>
    where DistanceName: LayoutDistanceName

    public static func <= <DistanceName>(_ some: Self, _ other: DistanceName) -> Constraint<DistanceName> {
        .init(some, is: .lessThanOrEqual, to: .distance(other))
    }

    public static func <= <DistanceName>(_ some: Self, _ other: Self) -> Constraint<DistanceName> {
        .init(some, is: .lessThanOrEqual, to: .interval(other))
    }

    public static func == <DistanceName>(_ some: Self, _ other: DistanceName) -> Constraint<DistanceName> {
        .init(some, is: .equal, to: .distance(other))
    }

    public static func == <DistanceName>(_ some: Self, _ other: Self) -> Constraint<DistanceName> {
        .init(some, is: .equal, to: .interval(other))
    }

    public static func >= <DistanceName>(_ some: Self, _ other: DistanceName) -> Constraint< DistanceName> {
        .init(some, is: .greaterThanOrEqual, to: .distance(other))
    }

    public static func >= <DistanceName>(_ some: Self, _ other: Self) -> Constraint<DistanceName> {
        .init(some, is: .greaterThanOrEqual, to: .interval(other))
    }
}

// Type: LayoutPosition.Horizontal.InRegion

extension LayoutPosition.Horizontal.InRegion {

    // Exposed

    // Topic: LayoutConstraint

    public typealias Constraint<DistanceName> = LayoutConstraint<RegionName, DistanceName>
    where DistanceName: LayoutDistanceName

    public static func <= <DistanceName>(_ some: Self, _ other: Self) -> Constraint<DistanceName> {
        .init(some ... other, is: .lessThanOrEqual, to: .zero)
    }

    public static func == <DistanceName>(_ some: Self, _ other: Self) -> Constraint<DistanceName> {
        .init(some ... other, is: .equal, to: .zero)
    }

    public static func >= <DistanceName>(_ some: Self, _ other: Self) -> Constraint<DistanceName> {
        .init(some ... other, is: .greaterThanOrEqual, to: .zero)
    }
}

// Type: LayoutPosition.Vertical.InRegion

extension LayoutPosition.Vertical.InRegion {

    // Exposed

    // Topic: LayoutConstraint

    public typealias Constraint<DistanceName> = LayoutConstraint<RegionName, DistanceName>
    where DistanceName: LayoutDistanceName

    public static func <= <DistanceName>(_ some: Self, _ other: Self) -> Constraint<DistanceName> {
        .init(some ... other, is: .lessThanOrEqual, to: .zero)
    }

    public static func == <DistanceName>(_ some: Self, _ other: Self) -> Constraint<DistanceName> {
        .init(some ... other, is: .equal, to: .zero)
    }

    public static func >= <DistanceName>(_ some: Self, _ other: Self) -> Constraint<DistanceName> {
        .init(some ... other, is: .greaterThanOrEqual, to: .zero)
    }
}
