//
//  Landmark.swift
//  Landmarks
//
//  Created by Rafael Ferreira on 2/11/21.
//

import CoreLocation
import SwiftUI

struct Landmark: Hashable, Codable {
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    private let imageName: String
    private let coordinates: Coordinates

    // MARK: - Computed variables

    var image: Image {
        Image(imageName)
    }

    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }

    // MARK: - Inner structures

    struct Coordinates: Hashable, Codable {
        let latitude: Double
        let longitude: Double
    }
}
