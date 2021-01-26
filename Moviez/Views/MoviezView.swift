//
//  ContentView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 25/01/2021.
//

import SwiftUI

struct MoviezView: View {
    var genreList = ["sci-fi", "Action", "Drama", "Tine travel", "Game"]
    
    var layout = [
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10))
    ]
    
    var body: some View {
        ZStack {
            Image("avengers")
                .blur(radius: 10.0)
            VStack(spacing: 30) {
                VStack{
                    Image("avengers-logo")
                    .resizable()
                    .frame(width: 180, height: 100, alignment: .top)
                    Image("avengers")
                        .resizable()
                        .frame(width: 250, height: 400, alignment: .center)
                        .cornerRadius(30)
                }
                
                RatingView(rating: 4, label: "4.78")
                
                
            }
            
        }
    }
}

struct MoviezView_Previews: PreviewProvider {
    static var previews: some View {
        MoviezView()
    }
}
