//
//  CustomBottomSheetView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 26/01/2021.
//

import SwiftUI

struct CustomBottomSheetView<Content: View> : View {
    @GestureState private var dragState = DragState.inactive
    @Binding var isShown: Bool
    
    var modalHeight: CGFloat = 600
    
    private func onDragEnded(drag: DragGesture.Value) {
        let dragThreshold = modalHeight * (2 / 3)
        if drag.predictedEndTranslation.height > dragThreshold || drag.translation.height > dragThreshold {
            isShown = false
        }
    }
    
    var content: () -> Content
    var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)
        
        return Group {
            ZStack {
                Spacer()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                    .blur(radius: isShown ? CGFloat((5.0 * fractionProgress(lowerLimit: 0, upperLimit: Double(modalHeight), current: Double(dragState.translation.height), inverted: true))) : 0.0)
                    .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                self.isShown = false
                            }
                    )
                
                VStack {
                    Spacer()
                    ZStack {
                        Color.white.opacity(1.0)
                            .frame(width: UIScreen.main.bounds.size.width, height: modalHeight)
                            .cornerRadius(35)
                            .shadow(radius: 5)
                        
                        self.content()
                            .padding()
                            .padding(.bottom, 65)
                            .frame(width: UIScreen.main.bounds.size.width, height: modalHeight)
                            .clipped()
                    }
                    .offset(y: isShown ? ((self.dragState.isDragging && dragState.translation.height >= 1) ? dragState.translation.height : 0) : modalHeight)
                    .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                    .gesture(drag)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct CustomBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBottomSheetView(isShown: .constant(true), content: {
            Text("Hello")
        })
    }
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}

func fractionProgress(lowerLimit: Double = 0, upperLimit: Double, current: Double, inverted: Bool = false) -> Double {
    var value: Double = 0
    
    if current >= lowerLimit {
        value = 1
    } else {
        value = (current - lowerLimit) / (upperLimit - lowerLimit)
    }
    
    if inverted {
        return (1 - value)
    } else {
        return value
    }
}
