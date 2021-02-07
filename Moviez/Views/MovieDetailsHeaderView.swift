//
//  MovieDetailsHeaderView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 26/01/2021.
//

import SwiftUI

struct MovieDetailsHeaderView: View {
    var movie: Moviez

    var body: some View {
        HStack(alignment: .top, spacing: 5) {
            Image(movie.imageUrl)
                .resizable()
                .frame(width: 150, height: 250)
                .cornerRadius(20)
                .shadow(radius: 10)
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(movie.name)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    Label("4h 2m" , systemImage: "clock")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                }
                
                Text("Genre: \(movie.genreString)")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                
                Text("Rating: 4.0")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                
                Text(movie.description)
                    .font(.system(size: 13))
                    .lineLimit(4)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
    }
}

extension Moviez {
    var genreString: String {
        ListFormatter.localizedString(byJoining: genres)
    }
}

struct MovieDetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsHeaderView(movie: Moviez.data[0])
            .previewLayout(.sizeThatFits)
    }
}
