//
//  Models.swift
//  modernistCase
//
//  Created by Mehmet Tırpan on 5.07.2025.
//

import Foundation

struct User: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let address: Address
    let profileImageURL: String?

    struct Address: Codable, Equatable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String

        var fullAddress: String {
            "\(street), \(suite), \(city), \(zipcode)"
        }
    }
}
