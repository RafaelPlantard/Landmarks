//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Rafael Ferreira on 2/12/21.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var data: ModelData
    @State private var showFavoritesOnly = false

    private var filteredLandmarks: [Landmark] {
        data.landmarks.filter { landmark in
            !showFavoritesOnly || landmark.isFavorite
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)"], id: \.self) { device in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: device))
                .environmentObject(ModelData())
        }
    }
}
