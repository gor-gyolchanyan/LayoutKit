//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

#if os(macOS) && targetEnvironment(macCatalyst) || os(iOS) || os(tvOS)
    import UIKit
#elseif os(macOS) && !targetEnvironment(macCatalyst)
    import AppKit
#endif

#if os(macOS) || os(iOS) || os(tvOS)
    @available(macOS 10.12, macCatalyst 13.0, iOS 10.0, tvOS 10.0, *)
    public protocol NSLayoutAnchorHaving {

        // Exposed

        // Topic: NSLayoutXAxisAnchor

        var leftAnchor: NSLayoutXAxisAnchor { get }
        var rightAnchor: NSLayoutXAxisAnchor { get }

        var leadingAnchor: NSLayoutXAxisAnchor { get }
        var trailingAnchor: NSLayoutXAxisAnchor { get }

        var centerXAnchor: NSLayoutXAxisAnchor { get }

        // Topic: NSLayoutYAxisAnchor

        var topAnchor: NSLayoutYAxisAnchor { get }
        var bottomAnchor: NSLayoutYAxisAnchor { get }

        var firstBaselineAnchor: NSLayoutYAxisAnchor { get }
        var lastBaselineAnchor: NSLayoutYAxisAnchor { get }

        var centerYAnchor: NSLayoutYAxisAnchor { get }

        // Topic: NSLayoutDimension

        var widthAnchor: NSLayoutDimension { get }
        var heightAnchor: NSLayoutDimension { get }
    }
#endif
