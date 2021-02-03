//
//  SeatsReservationView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 27/01/2021.
//

import SwiftUI

struct SeatsReservationView: View {
    @State var selectedSeats: [Seat] = Seat.data
    
    var body: some View {
//        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    createSeatsLegend()
                        .padding(.horizontal, 16)
                    topSeats()
                    createFrontRow()
                    createBackRow()
                    createFrontRow()
                    
                    VStack(spacing: 60) {
                        VStack(spacing: 1) {
                            ScreenShape()
                                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .square))
                                .foregroundColor(.black)
                                .shadow(radius: 20)
                            
                            Text("Eyes this way")
                                .textCase(.uppercase)
                                .font(.system(size: 13))
                        }
                        NavigationLink(destination: PaymentView()) {
                            Text("Buy Ticket")
                                .foregroundColor(.white)
                                .textCase(.uppercase)
                                .padding()
                                .padding(.horizontal, 30)
                                .background(Color(red: 0.8000, green: 0.1725, blue: 0.1490))
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        }
                    }
                    .padding(.bottom, 50)
                }
                
            }
            .navigationBarItems(leading: SeatsReservationNavBar())
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top, 0)
//        }
    }
    
    fileprivate func topSeats() -> some View {
        let rows: Int = 1
        let numberPerRow: Int = 4
        
        return VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<numberPerRow, id: \.self) { number in
                        ChairView(width: 70, accentColor: Color.accentColor, seat: Seat(id: UUID(), row: 2, number: 4), onSelect: { seat in
                            self.selectedSeats.append(seat)
                        }, onDeselect: { seat in
                            self.selectedSeats.removeAll(where: { $0.id == seat.id })
                        })
                    }
                }
            }
        }
    }
    
    fileprivate func createFrontRow() -> some View {
        let rows: Int = 3
        let numberPerRow: Int = 8
        
        return VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<numberPerRow, id: \.self) { number in
                        ChairView(width: 30, accentColor: Color.accentColor, seat: Seat(id: UUID(), row: row + 1, number: number + 1), onSelect: { seat in
                            self.selectedSeats.append(seat)
                        }, onDeselect: { seat in
                            self.selectedSeats.removeAll(where: { $0.id == seat.id })
                        })
                    }
                }
            }
        }
    }
    
    fileprivate func createBackRow() -> some View {
        let rows: Int = 4
        let numberPerRow: Int = 8
        
        return VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<numberPerRow, id: \.self) { number in
                        ChairView(width: 30, accentColor: Color.accentColor, seat: Seat(id: UUID(), row: row + 3, number: number + 15), onSelect: { seat in
                            self.selectedSeats.append(seat)
                        }, onDeselect: { seat in
                            self.selectedSeats.removeAll(where: { $0.id == seat.id })
                        })
                    }
                }
            }
        }
    }
    
    fileprivate func createSeatsLegend() -> some View {
        HStack {
            ChairLegendView(text: "Avaliavle", color: .gray)
            ChairLegendView(text: "Taken", color: .purple)
            ChairLegendView(text: "Selected", color: .accentColor)
        }
        .padding(.horizontal, 20)
        .padding(.top)
    }
}

struct SeatsReservationView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsReservationView(selectedSeats: Seat.data)
    }
}
