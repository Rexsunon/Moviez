//
//  MovieDetailsView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 26/01/2021.
//

import SwiftUI

struct MovieDetailsView: View {
    var movie: Moviez
    
    var body: some View {
        VStack(spacing: 30) {
            MovieDetailsHeaderView(movie: movie)
                .padding(.horizontal, 10)
            DatePickerView()
            VStack(spacing: 40) {
                MoviezWatchTimeGridView()
                NavigationLink(destination: SeatsReservationView(movie: movie)) {
                    Text("Book Now")
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 30)
                        .background(Color(red: 0.8000, green: 0.1725, blue: 0.1490))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
            }
        }
        .padding(.vertical)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Moviez.data[0])
            .previewLayout(.sizeThatFits)
    }
}
