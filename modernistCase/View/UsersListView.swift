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
            List(viewModel.filteredUsers) { user in
                NavigationLink(destination: UserDetailView(user: user, viewModel: viewModel)) {
                    UserRowView(user: user, isFavorite: viewModel.isFavorite(user))
                }
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Kullanıcılar")
        }
    }
}
