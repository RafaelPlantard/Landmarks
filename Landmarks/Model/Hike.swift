//
//  Hike.swift
//  Landmarks
//
//  Created by Rafael Ferreira on 2/14/21.
//

import Foundation

struct Hike: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let distance: Double
    let difficulty: Int
    let observations: [Observation]

    static let formatter = LengthFormatter()

    var distanceText: String {
        Hike.formatter.string(fromValue: distance, unit: .kilometer)
    }

    struct Observation: Decodable, Hashable {
        let distanceFromStart: Double
        let elevation: Range<Double>
        let pace: Range<Double>
        let heartRate: Range<Double>
    }
}
