//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Rafael Ferreira on 2/12/21.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink(destination: DetailView(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 12 mini", "iPad (8th generation)"], id: \.self) { device in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: device))
        }
    }
}
