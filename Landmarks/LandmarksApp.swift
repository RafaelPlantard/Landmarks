//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Rafael Ferreira on 2/11/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var data = ModelData()

    var body: some Scene {
        WindowGroup {
            LandmarkList()
                .environmentObject(data)
        }
    }
}
