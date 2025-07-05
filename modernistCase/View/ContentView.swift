//
//  ContentView.swift
//  modernistCase
//
//  Created by Mehmet Tırpan on 5.07.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UsersViewModel()

    var body: some View {
        TabView {
            UsersListView(viewModel: viewModel)
                .tabItem {
                    Label("Kullanıcılar", systemImage: "person.3")
                }

            FavoritesListView(viewModel: viewModel)
                .tabItem {
                    Label("Favoriler", systemImage: "star.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
