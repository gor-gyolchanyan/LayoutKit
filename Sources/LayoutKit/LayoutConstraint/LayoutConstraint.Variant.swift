//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

// Type: LayoutConstraint.Variant

extension LayoutConstraint {

    public enum Variant {

        // Exposed

        // Topic: Main

        case zero

        case distance(DistanceName)

        case interval(Interval)
    }
}

extension LayoutConstraint.Variant {

    // Exposed

    // Topic: Main

    public typealias Interval = LayoutInterval<RegionName>
}
