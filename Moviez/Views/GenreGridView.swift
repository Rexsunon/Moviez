//
//  GenreGridView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 26/01/2021.
//

import SwiftUI

struct GenreGridView: View {
    var genres: [String]
    
    var layout = [
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    var body: some View {
        HStack {
            LazyVGrid(columns: layout, alignment: .center) {
                ForEach(genres, id: \.self) { item in
                    Text(item)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 10)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .cornerRadius(10.0)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.size.width)
    }
}

struct GenreGridView_Previews: PreviewProvider {
    static var previews: some View {
        GenreGridView(genres: ["Games"])
    }
}
