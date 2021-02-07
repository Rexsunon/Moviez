//
//  MoviezApp.swift
//  Moviez
//
//  Created by Evidence Osikhena on 25/01/2021.
//

import SwiftUI

@main
struct MoviezApp: App {
    @State private var movie: [Moviez] = Moviez.data
    var body: some Scene {
        WindowGroup {
            //            NavigationView {
            MoviezView(moviez: $movie)
            //            }
        }
    }
}
