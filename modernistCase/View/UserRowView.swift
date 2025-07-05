//
//  UserRowView.swift
//  modernistCase
//
//  Created by Mehmet Tırpan on 5.07.2025.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    let isFavorite: Bool

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.profileImageURL ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))

            VStack(alignment: .leading) {
                Text(user.name).font(.headline)
                Text(user.email).font(.subheadline).foregroundColor(.gray)
            }

            Spacer()

            if isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
