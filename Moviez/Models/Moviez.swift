//
//  Moviez.swift
//  Moviez
//
//  Created by Evidence Osikhena on 25/01/2021.
//

import Foundation

struct Moviez: Identifiable {
    let id: UUID
    var name: String
    var imageUrl: String
    var logoUrl: String
    var rating: Double
    var genres: [Genre]
    
    struct Genre {
        let name: String
    }
    
    init(id: UUID = UUID(), name: String, imageUrl: String, logoUrl: String, rating: Double, genres: [Genre] = []) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.logoUrl = logoUrl
        self.rating = rating
        self.genres = genres
    }
}
