//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

// Type: LayoutPosition.Horizontal.InRegion

extension LayoutPosition.Horizontal {

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

extension LayoutPosition.Horizontal.InRegion {

    // Exposed

    // Topic: Main

    public typealias Position = LayoutPosition.Horizontal
}

// Type: LayoutRegionName

extension LayoutRegionName {

    // Exposed

    // Topic: LayoutPosition.Horizontal.InRegion

    public static func >> (_ some: Self, _ other: LayoutPosition.Horizontal) -> LayoutPosition.Horizontal.InRegion<Self> {
        .init(other, in: some)
    }

    public static func << (_ some: LayoutPosition.Horizontal, _ other: Self) -> LayoutPosition.Horizontal.InRegion<Self> {
        .init(some, in: other)
    }
}
