//
//  ViewDebugBackgroundColor.swift
//  WolfCore
//
//  Created by Wolf McNally on 6/25/17.
//  Copyright © 2017 WolfMcNally.com.
//

#if canImport(AppKit)
    import AppKit
#elseif canImport(UIKit)
    import UIKit
#endif

public func debugColor(_ debugColor: OSColor = .red, normal normalColor: OSColor = .clear, when isDebug: Bool = true) -> OSColor {
    guard isDebug else { return normalColor }
    let n = Color(normalColor)
    let d = Color(debugColor)

    let n2 = blend(from: .white, to: n, at: n.alpha).withAlphaComponent(1)
    let d2 = d.withAlphaComponent(1)
    let c = blend(from: n2, to: d2, at: 0.5)
    let c2 = c.withAlphaComponent(0.5)
    return c2.osColor
}