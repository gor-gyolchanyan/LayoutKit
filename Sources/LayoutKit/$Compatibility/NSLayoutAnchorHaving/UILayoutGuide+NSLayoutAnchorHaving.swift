//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

#if canImport(UIKit)
    import UIKit

    // Type: UILayoutGuide

    @available(macCatalyst 13.0, iOS 10.0, tvOS 10.0, *)
    extension UILayoutGuide: NSLayoutAnchorHaving {

        // Exposed

        // Protocol: NSLayoutAnchorHaving
        // Topic: NSLayoutYAxisAnchor

        public var firstBaselineAnchor: NSLayoutYAxisAnchor {
            topAnchor
        }

        public var lastBaselineAnchor: NSLayoutYAxisAnchor {
            bottomAnchor
        }
    }
#endif
