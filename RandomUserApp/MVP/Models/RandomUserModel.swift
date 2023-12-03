//
//  RandomUserModel.swift
//  RandomUserApp
//
//  Created by macbook on 27.11.2023.
//

import Foundation

struct RandomUserModel: Codable {
    let results: [Results]
}

struct Results: Codable {
    let gender: String
    let name: Name
    let email: String
    let picture: Picture
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Codable {
    let large: String
}
