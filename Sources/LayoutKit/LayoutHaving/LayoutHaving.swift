//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

// Type: LayoutHaving

public protocol LayoutHaving {

    // Exposed

    // Topic: Main

    associatedtype RegionName: LayoutRegionName

    associatedtype DistanceName: LayoutDistanceName

    var layout: Layout<RegionName, DistanceName> { get }
}
