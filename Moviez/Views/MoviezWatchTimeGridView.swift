//
//  MoviezWatchTimeGridView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 26/01/2021.
//

import SwiftUI

struct MoviezWatchTimeGridView: View {
    let watchTimeList: [String] = ["10:00am", "10:45am", "11:00am", "11:30am", "12:00pm", "12:30pm", "1:00pm"]
    
    let layout = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Time")
                .fontWeight(.semibold)
                .textCase(.uppercase)
                .font(.system(size: 20))

            LazyVGrid(columns: layout) {
                ForEach(watchTimeList, id: \.self) { time in
                    Text(time)
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 3)
                }
            }
        }
        .foregroundColor(.black)
        .padding(.horizontal, 16)
    }
}

struct MoviezWatchTimeGridView_Previews: PreviewProvider {
    static var previews: some View {
        MoviezWatchTimeGridView()
    }
}
