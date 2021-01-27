//
//  DatePickerView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 26/01/2021.
//

import SwiftUI

struct DatePickerView: View {
    
    private var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "eee D"
        
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Day")
                .fontWeight(.semibold)
                .textCase(.uppercase)
                .font(.system(size: 20))
                .padding(.leading)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(daysOfCurrentWeek(), id: \.self) { data in
                        let str = formatter.string(from: data)
                        
                        VStack(spacing: 10) {
                            Text(str.prefix(4))
                                .font(.system(size: 16))
                            //                        RoundedRectangle(cornerRadius: CGFloat(5.0) / 2.0)
                            //                            .frame(width: 40, height: CGFloat(2.0))
                            //                          .foregroundColor(Color.white)
                            //                            .padding(5)
                            Text(str.suffix(3))
                                .font(.system(size: 14))
                                .padding(12)
                                .background(Color.white)
                                .cornerRadius(48)
                                .shadow(radius: 3)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 3)
                    }
                }
            }
            .padding(.leading)
        }
        .foregroundColor(.black)
        .frame(width: UIScreen.main.bounds.size.width)
        .padding(.leading, 18)
    }
    
    func daysOfCurrentWeek() -> [Date] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let dayOfWeek = calendar.component(.weekday, from: today)
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
        
        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }  // use `flatMap` in Xcode versions before 9.3
        //            .filter { !calendar.isDateInWeekend($0) }
        
        return days
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
            .previewLayout(.sizeThatFits)
    }
}
