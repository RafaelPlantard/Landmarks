//
//  Landmark.swift
//  Landmarks
//
//  Created by Rafael Ferreira on 2/11/21.
//

import CoreLocation
import SwiftUI

struct Landmark: Hashable, Decodable, Identifiable {
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String

    var isFavorite: Bool

    // MARK: - Computed variables

    private let imageName: String

    var image: Image {
        Image(imageName)
    }

    private let coordinates: Coordinates

    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }

    // MARK: - Inner structures

    struct Coordinates: Hashable, Decodable {
        let latitude: Double
        let longitude: Double
    }
}
