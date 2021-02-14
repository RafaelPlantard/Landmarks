//
//  CircleImage.swift
//  Landmarks
//
//  Created by Rafael Ferreira on 2/11/21.
//

import SwiftUI

struct CircleImage: View {
    let image: Image

    // MARK: - View conformance

    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("TurtleRock"))
    }
}
