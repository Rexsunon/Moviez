//
//  SeatsReservationNavBar.swift
//  Moviez
//
//  Created by Evidence Osikhena on 30/01/2021.
//

import SwiftUI

struct SeatsReservationNavBar: View {
    var title: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Avengers: Endgame")
                        .font(.system(size: 20))
                        .bold()
                    
                    Label("3h 2m", systemImage: "clock")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Text("11:30am Friday, 13 july")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .frame(width: .infinity)
    }
}

struct SeatsReservationNavBar_Previews: PreviewProvider {
    static var previews: some View {
        SeatsReservationNavBar(title: "Avengers: Endgame")
            .previewLayout(.sizeThatFits)
    }
}
