//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Rafael Ferreira on 2/11/21.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var data: ModelData

    let landmark: Landmark

    var landmarkIndex: Int {
        data.landmarks.firstIndex(where: { element in element.id == landmark.id }) ?? 0
    }

    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)

                    FavoriteButton(isSet: $data.landmarks[landmarkIndex].isFavorite)
                }

                HStack {
                    Text(landmark.park)

                    Spacer()

                    Text(landmark.state)
                }
                .font(.subheadline)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)

                Text(landmark.description)
            }
            .padding()

            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let data = ModelData()

    static var previews: some View {
        LandmarkDetail(landmark: data.landmarks[0])
            .environmentObject(data)
    }
}
