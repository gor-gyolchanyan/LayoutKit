//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

import NameKit

// Type: LayoutRegionName

public protocol LayoutRegionName: RawRepresentable
where RawValue == Name {

}

extension LayoutRegionName {

    // Exposed

    // Topic: LayoutInterval

    public typealias Interval = LayoutInterval<Self>
}
