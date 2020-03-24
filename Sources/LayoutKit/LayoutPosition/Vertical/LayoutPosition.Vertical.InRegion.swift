//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

// Type: LayoutPosition.Vertical.InRegion

extension LayoutPosition.Vertical {

    public struct InRegion<RegionName>
    where RegionName: LayoutRegionName {

        // Exposed

        // Topic: Main

        public init(_ position: Position, in regionName: RegionName) {
            self.regionName = regionName
            self.position = position
        }

        public var regionName: RegionName

        public var position: Position
    }
}

extension LayoutPosition.Vertical.InRegion {

    // Exposed

    // Topic: Main

    public typealias Position = LayoutPosition.Vertical
}

// Type: LayoutRegionName

extension LayoutRegionName {

    // Exposed

    // Topic: LayoutPosition.Vertical.InRegion

    public static func >> (_ some: Self, _ other: LayoutPosition.Vertical) -> LayoutPosition.Vertical.InRegion<Self> {
        .init(other, in: some)
    }

    public static func << (_ some: LayoutPosition.Vertical, _ other: Self) -> LayoutPosition.Vertical.InRegion<Self> {
        .init(some, in: other)
    }
}
