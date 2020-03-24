//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

#if canImport(UIKit)
    import UIKit
#endif

#if canImport(AppKit)
    import AppKit
#endif

#if canImport(UIKit) || canImport(AppKit)

    @available(macOS 10.12, macCatalyst 13.0, iOS 10.0, tvOS 10.0, *)
    public struct NSLayoutCompiler<RegionName, DistanceName>
    where RegionName: LayoutRegionName, DistanceName: LayoutDistanceName {

        // Exposed

        // Topic: Main

        public init(
            region: @escaping (RegionName) -> NSLayoutAnchorHaving,
            distance: @escaping (DistanceName) -> CGFloat
        ) {
            _region = region
            _distance = distance
        }

        // Concealed

        // Topic: Main

        let _region: (RegionName) -> NSLayoutAnchorHaving

        let _distance: (DistanceName) -> CGFloat
    }

    @available(macOS 10.12, macCatalyst 13.0, iOS 10.0, tvOS 10.0, *)
    extension NSLayoutCompiler {

        // Exposed

        public func compile(_ regionName: RegionName) -> NSLayoutAnchorHaving {
            _region(regionName)
        }

        public func compile(_ distanceName: DistanceName) -> CGFloat {
            _distance(distanceName)
        }

        public func compile(_ position: LayoutPosition.Horizontal.InRegion<RegionName>) -> NSLayoutXAxisAnchor {
            let regionName = compile(position.regionName)
            switch position.position {
                case .left:      return regionName.leftAnchor
                case .right:     return regionName.rightAnchor
                case .leading:   return regionName.leadingAnchor
                case .trailing:  return regionName.trailingAnchor
                case .centerX:   return regionName.centerXAnchor
            }
        }

        public func compile(_ position: LayoutPosition.Vertical.InRegion<RegionName>) -> NSLayoutYAxisAnchor {
            let regionName = compile(position.regionName)
            switch position.position {
                case .top:           return regionName.topAnchor
                case .bottom:         return regionName.bottomAnchor
                case .firstBaseline:  return regionName.firstBaselineAnchor
                case .lastBaseline:   return regionName.lastBaselineAnchor
                case .centerY:        return regionName.centerYAnchor
            }
        }

        public func compile(_ interval: LayoutInterval<RegionName>) -> NSLayoutDimension {
            switch interval {
                case .horizontal(let horizontal):
                    let first = compile(horizontal.first)
                    let second = compile(horizontal.second)
                    return first.anchorWithOffset(to: second)
                case .vertical(let vertical):
                    let first = compile(vertical.first)
                    let second = compile(vertical.second)
                    return first.anchorWithOffset(to: second)
            }
        }

        public func compile(_ constraint: LayoutConstraint<RegionName, DistanceName>) -> NSLayoutConstraint {
            let first = compile(constraint.interval)
            switch constraint.variant {
                case .zero:
                    switch constraint.relation {
                        case .lessThanOrEqual:
                            return first.constraint(lessThanOrEqualToConstant: .zero)
                        case .equal:
                            return first.constraint(equalToConstant: .zero)
                        case .greaterThanOrEqual:
                            return first.constraint(greaterThanOrEqualToConstant: .zero)
                    }
                case .distance(let distanceName):
                    let distance = compile(distanceName)
                    switch constraint.relation {
                        case .lessThanOrEqual:
                            return first.constraint(lessThanOrEqualToConstant: distance)
                        case .equal:
                            return first.constraint(equalToConstant: distance)
                        case .greaterThanOrEqual:
                            return first.constraint(greaterThanOrEqualToConstant: distance)
                    }
                case .interval(let interval):
                    let second = compile(interval)
                    switch constraint.relation {
                        case .lessThanOrEqual:
                            return first.constraint(lessThanOrEqualTo: second, multiplier: 1)
                        case .equal:
                            return first.constraint(equalTo: second, multiplier: 1)
                        case .greaterThanOrEqual:
                            return first.constraint(greaterThanOrEqualTo: second, multiplier: 1)
                    }
            }
        }

        public func compile(_ layout: Layout<RegionName, DistanceName>) -> [NSLayoutConstraint] {
            layout._constraintSet.map(compile)
        }
    }

    // Type: Layout

    @available(macOS 10.12, macCatalyst 13.0, iOS 10.0, tvOS 10.0, *)
    extension LayoutHaving {

        // Exposed

        // Topic: Convenience

        public func compile(region: (RegionName) -> NSLayoutAnchorHaving, distance: (DistanceName) -> CGFloat) -> [NSLayoutConstraint] {
            withoutActuallyEscaping(region) { region in
            withoutActuallyEscaping(distance) { distance in
                let compiler = NSLayoutCompiler(region: region, distance: distance)
                return compiler.compile(self.layout)
            }}
        }
    }

    extension Array
    where Element == NSLayoutConstraint {

        // Exposed

        // Topic: Convenience

        public func activate() {
            NSLayoutConstraint.activate(self)
        }
    }
#endif
