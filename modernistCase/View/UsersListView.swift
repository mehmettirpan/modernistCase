//
//  UsersListView.swift
//  modernistCase
//
//  Created by Mehmet Tırpan on 5.07.2025.
//

import SwiftUI

struct UsersListView: View {
    @ObservedObject var viewModel: UsersViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.filteredUsers) { user in
                    NavigationLink(destination: UserDetailView(user: user, viewModel: viewModel)) {
                        UserRowView(user: user, isFavorite: viewModel.isFavorite(user))
                    }
                    .swipeActions(edge: .leading) {
                        if viewModel.isFavorite(user) {
                            Button {
                                viewModel.toggleFavorite(user)
                            } label: {
                                Label("Favoriden Çıkar", systemImage: "star.slash")
                            }
                            .tint(.red)
                        } else {
                            Button {
                                viewModel.toggleFavorite(user)
                            } label: {
                                Label("Favorilere Ekle", systemImage: "star")
                            }
                            .tint(.yellow)
                        }
                    }
                }
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Kullanıcılar")
        }
    }
}
