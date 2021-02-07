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
    var genres: [String]
    var description: String
    
    struct Genre {
        let name: String
    }
    
    init(id: UUID = UUID(), name: String, imageUrl: String, logoUrl: String, rating: Double, genres: [String] = [], description: String) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.logoUrl = logoUrl
        self.rating = rating
        self.genres = genres
        self.description = description
    }
}

extension Moviez {
    static var data: [Moviez] {
        [
            Moviez(id: UUID(), name: "Avengers: Endgame", imageUrl: "avengers", logoUrl: "avengers-logo", rating: 4.0, genres: ["sci-fi", "Action", "Drama", "Tine travel", "Game"], description: "Twenty-three days after Thanos used the Infinity Gauntlet to kill half of all life in the universe"),
            Moviez(id: UUID(), name: "The incredibles", imageUrl: "theincredibles", logoUrl: "incredibles", rating: 3.0, genres: ["sci-fi", "Action", "Drama"], description: "Forced to adopt a civilian identity and stuck in a white-collar job, Mr Incredible itches to get back into action. When he is lured into a trap by the evil Syndrome, his family contrives to save him")
        ]
    }
}
