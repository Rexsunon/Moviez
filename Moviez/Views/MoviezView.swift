//
//  ContentView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 25/01/2021.
//

import SwiftUI

struct MoviezView: View {
    @State var isShown = false
    var genreList = ["sci-fi", "Action", "Drama", "Tine travel", "Game"]
    
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
                        .gesture(
                            TapGesture()
                                .onEnded {
                                    self.isShown.toggle()
                                }
                        )
                }
                
                RatingView(rating: 4, label: "4.78")
                
                GenreGridView(genres: genreList)
            }
            
            CustomBottomSheetView(isShown: $isShown, modalHeight: 760) {
                MovieDetailsView()
            }
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            .padding()
        }
    }
}

struct MoviezView_Previews: PreviewProvider {
    static var previews: some View {
        MoviezView()
    }
}
