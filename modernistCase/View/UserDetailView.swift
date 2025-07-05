//
//  UserDetailView.swift
//  modernistCase
//
//  Created by Mehmet Tırpan on 5.07.2025.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    @ObservedObject var viewModel: UsersViewModel

    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: user.profileImageURL ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))

            Text(user.name).font(.title2)
            Text(user.email).foregroundColor(.gray)
            Text("Telefon: \(user.phone)")
            Text("Adres: \(user.address.fullAddress)")

            Button(action: {
                viewModel.toggleFavorite(user)
            }) {
                Label(
                    viewModel.isFavorite(user) ? "Favorilerden Çıkar" : "Favorilere Ekle",
                    systemImage: viewModel.isFavorite(user) ? "star.slash" : "star"
                )
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle(user.name)
    }
}
