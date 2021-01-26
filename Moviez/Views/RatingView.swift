//
//  RatingView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 26/01/2021.
//

import SwiftUI

struct RatingView: View {
    var rating: Int
    
    var label = ""
    var maxRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack(spacing: 20) {
            if label.isEmpty == false {
                Text(label)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            HStack {
                ForEach(1..<maxRating + 1) { number in
                    self.image(for: number)
                        .foregroundColor(number > self.rating
                                ? self.offColor : self.onColor)
                }
                
            }
            .padding(8)
            .background(Color.white)
            .opacity(0.5)
            .cornerRadius(10.0)
        }
        
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4)
    }
}
