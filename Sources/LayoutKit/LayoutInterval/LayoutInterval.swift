//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

// Type: LayoutInterval

public enum LayoutInterval<RegionName>
where RegionName: LayoutRegionName {

    // Exposed

    // Topic: Main

    case horizontal(Horizontal)

    case vertical(Vertical)
}

// Type: LayoutPosition.Horizontal.InRegion

extension LayoutPosition.Horizontal.InRegion {

    // Exposed

    // Topic: LayoutInterval

    public static func ... (_ some: Self, _ other: Self) -> LayoutInterval<RegionName> {
        .horizontal(.init(from: some, to: other))
    }
}

// Type: LayoutPosition.Vertical.InRegion

extension LayoutPosition.Vertical.InRegion {

    // Exposed

    // Topic: LayoutInterval

    public static func ... (_ some: Self, _ other: Self) -> LayoutInterval<RegionName> {
        .vertical(.init(from: some, to: other))
    }
}

// Type: LayoutRegionName

extension LayoutRegionName {

    // Exposed

    // Topic: LayoutInterval

    public var width: LayoutInterval<Self> {
        self >> .left ... self >> .right
    }

    public var height: LayoutInterval<Self> {
        self >> .bottom ... self >> .top
    }
}
