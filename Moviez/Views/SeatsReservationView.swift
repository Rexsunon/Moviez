//
//  SeatsReservationView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 27/01/2021.
//

import SwiftUI

struct SeatsReservationView: View {
    @Binding var selectedSeats: [Seat]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.3), .clear]), startPoint: .init(x: 0.5, y: 0.0), endPoint: .init(x: 0.5, y: 0.5)))
                .frame(height: 420)
                .clipShape(ScreenShape(isClip: true))
                .cornerRadius(20)
                
            ScreenShape()
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .square))
                .frame(height: 420)
                .foregroundColor(.accentColor)
        }
//        .padding(.horizontal, 18)
    }
}

struct SeatsReservationView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsReservationView(selectedSeats: .constant([]))
    }
}
