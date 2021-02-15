//
//  Badge.swift
//  Landmarks
//
//  Created by Rafael Ferreira on 2/14/21.
//

import SwiftUI

struct Badge: View {
    static let rotationCount = 8

    var badgeSymbols: some View {
        ForEach(0 ..< Self.rotationCount) { i in
            RotatedBadgeSymbol(
                angle: .degrees(Double(i) / Double(Self.rotationCount)) * 360
            )
        }
        .opacity(0.5)
    }

    // MARK: - View conformance

    var body: some View {
        ZStack {
            BadgeBackground()

            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1 / 4, anchor: .top)
                    .position(x: geometry.size.width / 2, y: (3 / 4) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
