//
//  UsersViewModel.swift
//  modernistCase
//
//  Created by Mehmet Tırpan on 5.07.2025.
//

import Foundation

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var searchText: String = ""
    @Published var favoritesSearchText: String = ""
    @Published var favorites: [User] = []

    init() {
        loadUsers()
        loadFavorites()
    }

    var filteredUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.email.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var filteredFavorites: [User] {
        if favoritesSearchText.isEmpty {
            return favorites
        } else {
            return favorites.filter {
                $0.name.localizedCaseInsensitiveContains(favoritesSearchText) ||
                $0.email.localizedCaseInsensitiveContains(favoritesSearchText)
            }
        }
    }

    func toggleFavorite(_ user: User) {
        if favorites.contains(user) {
            favorites.removeAll { $0 == user }
        } else {
            favorites.append(user)
        }
        saveFavorites()
    }

    func isFavorite(_ user: User) -> Bool {
        favorites.contains(user)
    }

    private func loadUsers() {
        guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
            print("users.json bulunamadı")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let users = try JSONDecoder().decode([User].self, from: data)
            DispatchQueue.main.async {
                self.users = users
            }
        } catch {
            print("Veri yüklenemedi: \(error.localizedDescription)")
        }
    }

    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: "favorites"),
           let favorites = try? JSONDecoder().decode([User].self, from: data) {
            self.favorites = favorites
        }
    }

    private func saveFavorites() {
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: "favorites")
        }
    }
}
