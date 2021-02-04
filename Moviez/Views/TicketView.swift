//
//  TicketView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 04/02/2021.
//

import LocalAuthentication
import SwiftUI

struct TicketView: View {
    @State private var isUnlock: Bool = false
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Image("avengers")
                    .resizable()
                    .frame(width: 130, height: 180)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .offset(x: -85, y: 100)
                    .padding(.horizontal, -60)
                    .padding(.vertical, -150)
                
//                Text("he")
                    
            }
            .zIndex(1.0)

            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Cinema")
                            .font(.callout)
                            .foregroundColor(Color("SubText"))
                        Text("IMAX 3D")
                            .bold()
                            .foregroundColor(Color("ButtonColor"))
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Date")
                                .font(.callout)
                                .foregroundColor(Color("SubText"))
                            Text("Friday, 03 July")
                                .bold()
                                .foregroundColor(Color("ButtonColor"))
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Start")
                                .font(.callout)
                                .foregroundColor(Color("SubText"))
                            Text("11:25 am")
                                .bold()
                                .foregroundColor(Color("ButtonColor"))
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("End")
                                .font(.callout)
                                .foregroundColor(Color("SubText"))
                            Text("2:57 pm")
                                .bold()
                                .foregroundColor(Color("ButtonColor"))
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Audi")
                                .font(.callout)
                                .foregroundColor(Color("SubText"))
                            Text("02")
                                .bold()
                                .foregroundColor(Color("ButtonColor"))
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Row")
                                .font(.callout)
                                .foregroundColor(Color("SubText"))
                            Text("G")
                                .bold()
                                .foregroundColor(Color("ButtonColor"))
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Seats")
                                .font(.callout)
                                .foregroundColor(Color("SubText"))
                            Text("G31,G32")
                                .bold()
                                .foregroundColor(Color("ButtonColor"))
                        }
                    }
                    
                    Divider()
                    
                    VStack(spacing: 50) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Ticket ID")
                                    .font(.callout)
                                    .foregroundColor(Color("SubText"))
                                Text("GHE-7829-JILK-1509")
                                    .bold()
                                    .foregroundColor(Color("ButtonColor"))
                            }
                            
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Price")
                                    .font(.callout)
                                    .foregroundColor(Color("SubText"))
                                Text("$ 22:88")
                                    .bold()
                                    .foregroundColor(Color("ButtonColor"))
                            }
                        }
                        
                        Text("Tap for bar code")
                            .font(.callout)
                            .foregroundColor(Color("SubText"))
                    }
                }
                .padding(.top, 100)
            }
            .frame(width: UIScreen.main.bounds.width / 1.25, height: 500)
            .padding(20)
            .background(Color("CardColor"))
            .cornerRadius(10.0)
        }
//        .background(Color.black)
//        .frame(width: UIScreen.main.bounds.width / 1.25)
//        .padding(20)
//        .background(Color.gray.opacity(0.2))
//        .cornerRadius(10.0)
        
    }
    
    func authorized() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Use face id to authenticate and purchase your movie ticket"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlock = true
                    } else {
                        // error
                    }
                }
            }
        } else {
            // error
        }
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
            
    }
}
