//
//  MovieDetailsHeaderView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 26/01/2021.
//

import SwiftUI

struct MovieDetailsHeaderView: View {
    var body: some View {
        HStack(spacing: 5) {
            Image("avengers")
                .resizable()
                .frame(width: 150, height: 250)
                .cornerRadius(20)
                .shadow(radius: 10)
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Avengers: Endgame")
                    .font(.system(size: 20))
                        .fontWeight(.semibold)
                    Label("4h 2m" , systemImage: "clock")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Text("Genre: Action, Fantacy, Sci-fi, drama, Time travel")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Rating: 4.9")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Twenty-three days after Thanos used the Infinity Gauntlet to kill half of all life in the universe")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
    }
}

struct MovieDetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsHeaderView()
            .previewLayout(.sizeThatFits)
    }
}
