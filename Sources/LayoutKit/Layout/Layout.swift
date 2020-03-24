//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

// Type: Layout

public struct Layout<RegionName, DistanceName>
where RegionName: LayoutRegionName, DistanceName: LayoutDistanceName {

    // Concealed

    // Topic: Main

    init(_constraintSet constraintSet: _ConstraintSet) {
        _constraintSet = constraintSet
    }

    var _constraintSet: _ConstraintSet
}

extension Layout {

    // Exposed

    // Topic: Main

    public typealias Constraint = LayoutConstraint<RegionName, DistanceName>

    public init() {
        self.init(_constraintSet: .init())
    }

    public static func += (_ layout: inout Self, _ other: Constraint) {
        layout._constraintSet.append(other)
    }

    // Concealed

    // Topic: Main

    typealias _ConstraintSet = [Constraint]
}
