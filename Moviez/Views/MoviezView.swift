//
//  ContentView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 25/01/2021.
//

import SwiftUI

struct MoviezView: View {
    @Binding var movie: Moviez
    @State var isShown = false
    @State private var isPresented = false
//    @Binding var seats: [Seat]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(movie.imageUrl)
                    .blur(radius: 10.0)
                VStack(spacing: 30) {
                    VStack{
                        Image(movie.logoUrl)
                        .resizable()
                        .frame(width: 180, height: 100, alignment: .top)
                        Image(movie.imageUrl)
                            .resizable()
                            .frame(width: 250, height: 400, alignment: .center)
                            .cornerRadius(30)
                            .gesture(
                                TapGesture()
                                    .onEnded {
                                        self.isPresented.toggle()
                                    }
                            )
                    }
                    
                    RatingView(rating: Int(movie.rating), label: "\(movie.rating)")
                    
                    GenreGridView(genres: movie.genres)
                }
//                .sheet(isPresented: $isPresented) {
//                    MovieDetailsView()
//                }
                CustomBottomSheetView(isShown: $isPresented, modalHeight: 760) {
                    MovieDetailsView(movie: $movie)
                }
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                .padding()
            }
            
        }
    }
}

struct MoviezView_Previews: PreviewProvider {
    static var previews: some View {
        MoviezView(movie: .constant(Moviez.data[1]))
    }
}
