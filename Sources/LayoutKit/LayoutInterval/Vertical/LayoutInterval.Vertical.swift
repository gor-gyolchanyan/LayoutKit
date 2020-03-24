//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

// Type: LayoutInterval.Vertical

extension LayoutInterval {

    public struct Vertical {

        // Exposed

        // Topic: Main

        public init(from first: Position, to second: Position) {
            self.first = first
            self.second = second
        }

        public var first: Position

        public var second: Position
    }
}

extension LayoutInterval.Vertical {

    // Exposed

    // Topic: Main

    public typealias Position = LayoutPosition.Vertical.InRegion<RegionName>
}
