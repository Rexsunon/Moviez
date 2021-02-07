//
//  PaymentView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 31/01/2021.
//

import LocalAuthentication
import SwiftUI

struct PaymentView: View {
    @Binding var movie: Moviez
    @State private var text: String = ""
    @State private var textHeight: Double = 20
    @State private var isUnlock: Bool = false
    
    let listRowPadding: Double = 5 // This is a guess
    let listRowMinHeight: Double = 45 // This is a guess
    var listRowHeight: Double {
        max(listRowMinHeight, textHeight + 2 * listRowPadding)
    }
    
    var listItems: [String] = ["Face - ID", "Credit/Debit Card", "Net Banking"]
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading, spacing: 25) {
                HStack(alignment: .top, spacing: 20) {
                    Image(movie.imageUrl)
                        .resizable()
                        .frame(width: 100, height: 130)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(movie.name)
                            .font(.system(size: 20))
                            .bold()
                        
                        VStack(alignment: .leading) {
                            Text("Duration: 3h 2m")
                            Text("11:25am Friday, 03 July")
                            Text("Tickets: 2")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    .padding(.top, 5)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Sub-Title")
                        Spacer()
                        Text("$ 19.89")
                    }
                    .font(.callout)
                    
                    HStack {
                        Text("Internet handling fee")
                        Spacer()
                        Text("$ 2.99")
                    }
                    .font(.callout)
                    
                    Divider()
                    
                    HStack {
                        Text("Total payable amount")
                        Spacer()
                        Text("$ 22.88")
                    }
                    .font(.title3)
                    
                    Divider()
                }
                
                HStack {
                    TextField("Type a promocode", text: $text)
                        .font(.callout)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Apply")
                            .font(.callout)
                            .foregroundColor(.white)
                    }
                    .frame(width: 100, height: 35, alignment: .center)
                    .background(Color(red: 0.8000, green: 0.1725, blue: 0.1490))
                    .cornerRadius(10)
                    .shadow(radius: 10)
                }
                
                VStack {
                    List {
                        ForEach(listItems, id: \.self) { item in
                            NavigationLink(
                                destination: Text("")) {
                                Text(item)
                            }
                        }
                    }
                    .listItemTint(Color.black)
                    .frame(height: CGFloat(listItems.count) * CGFloat(self.listRowHeight))
                    Text("See more payment options")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
            }
            .frame(width: UIScreen.main.bounds.width / 1.25)
            .padding(20)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10.0)
            
//            NavigationLink(destination: TicketView()) {
                if !isUnlock {
                    
                    Button(action: {
                        self.authorized()
                        self.isUnlock = false
                    }) {
                        NavigationLink(destination: TicketView(movie: $movie)) {
                        Text("Pay $22.88")
                            .fontWeight(.bold)
                            .textCase(.uppercase)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal, 30)
                            .background(Color(red: 0.8000, green: 0.1725, blue: 0.1490))
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        }
                    }
                }
                //                self.isUnlock = false
//            }
        }
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

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(movie: .constant(Moviez.data[0]))
    }
}
