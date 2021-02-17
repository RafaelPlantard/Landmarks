//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Rafael Ferreira on 2/16/21.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var data: ModelData

    var body: some View {
        NavigationView {
            List {
                data.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())

                ForEach(data.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: data.categories[key] ?? [])
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Features")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
