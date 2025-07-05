//
//  FavoritesListView.swift
//  modernistCase
//
//  Created by Mehmet Tırpan on 5.07.2025.
//


import SwiftUI

struct FavoritesListView: View {
    @ObservedObject var viewModel: UsersViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.filteredFavorites) { user in
                    NavigationLink(destination: UserDetailView(user: user, viewModel: viewModel)) {
                        UserRowView(user: user, isFavorite: true)
                    }
                    .swipeActions(edge: .trailing) {
                        Button {
                            viewModel.toggleFavorite(user)
                        } label: {
                            Label("Favoriden Çıkar", systemImage: "star.slash")
                        }
                        .tint(.red)
                    }
                }
            }
            .searchable(text: $viewModel.favoritesSearchText)
            .navigationTitle("Favoriler")
        }
    }
}
