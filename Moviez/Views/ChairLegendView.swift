//
//  ChairLegendView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 30/01/2021.
//

import SwiftUI

struct ChairLegendView: View {
    var text = "selected"
    var color: Color = Color.gray
    
    var body: some View {
        HStack {
//            ChairView(width: 20, accentColor: color, isSelectable: false)
            Rectangle()
                .fill(color)
                .frame(width: 15, height: 15)
                .cornerRadius(5)
            
            Text(text)
                .font(.subheadline)
                .foregroundColor(.black)
//                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .textCase(.uppercase)
    }
}

struct ChairLegendView_Previews: PreviewProvider {
    static var previews: some View {
        ChairLegendView()
    }
}
