//
//  ModelData.swift
//  Landmarks
//
//  Created by Rafael Ferreira on 2/12/21.
//

import Combine
import Foundation

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("LandmarkData.json")
    var hikes: [Hike] = load("HikeData.json")

    var features: [Landmark] {
        landmarks.filter { landmark in
            landmark.isFeatured
        }
    }

    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks, by: { (landmark: Landmark) in landmark.category.rawValue })
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }

    do {
        let decoder = JSONDecoder()

        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
