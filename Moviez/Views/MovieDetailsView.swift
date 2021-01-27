//
//  MovieDetailsView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 26/01/2021.
//

import SwiftUI

struct MovieDetailsView: View {
    var body: some View {
        VStack(spacing: 30) {
            MovieDetailsHeaderView()
                .padding(.horizontal, 10)
            DatePickerView()
            VStack(spacing: 40) {
                MoviezWatchTimeGridView()
                Button(action: {
                    
                }) {
                    Text("Book Now")
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .font(.system(size: 20))
                    
                }
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal, 30)
                .background(Color.orange)
                .cornerRadius(10)
                .shadow(radius: 10)
            }
            
        }
        .padding(.vertical)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView()
            .previewLayout(.sizeThatFits)
    }
}
