//
//  MapView.swift
//  Landmarks
//
//  Created by Rafael Ferreira on 2/11/21.
//

import MapKit
import SwiftUI

struct MapView: View {
    var coordinate: CLLocationCoordinate2D

    // MARK: - Private variables

    @State private var region = MKCoordinateRegion()

    // MARK: - View conformance

    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }

    // MARK: - Private functions

    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(
            coordinate: CLLocationCoordinate2D(
                latitude: 34.011_286, longitude: -116.166_868
            )
        )
    }
}
