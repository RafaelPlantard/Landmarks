//
//  ContentView.swift
//  Landmarks
//
//  Created by Rafael Ferreira on 2/16/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .feature

    enum Tab {
        case feature
        case list
    }

    // MARK: - View conformance

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.feature)

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
