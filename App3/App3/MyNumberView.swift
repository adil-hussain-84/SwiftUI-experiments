//
//  MyNumberView.swift
//  App3
//
//  Created by Adil Hussain on 03/09/2021.
//

import SwiftUI

struct MyNumberView: View {
    
    @State private var isDragging = false
    @State private var isPressed = false
    @State private var isTapped = false
    
    let myNumber: MyNumber
    
    var body: some View {
        HStack {
            Text(getTitleText())
                .font(.body)
                .padding()
            Spacer()
        }
        .listRowBackground(getListRowBackground())
        .contentShape(Rectangle()) // Makes the entire HStack tappable
        .onTapGesture {
            withAnimation { isTapped = true }
            
            onTap()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation { isTapped = false }
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { gesture in
                    if !isDragging {
                        isDragging = true
                        withAnimation { isPressed = true }
                        return
                    }
                    
                    if (isPressed) {
                        let absoluteHeight = abs(gesture.translation.height)
                        let absoluteWidth = abs(gesture.translation.width)
                        
                        if (absoluteHeight > 7 || absoluteWidth > 7) {
                            withAnimation { isPressed = false }
                        }
                    }
                }
                .onEnded { _ in
                    isDragging = false
                    
                    if (isPressed) {
                        onTap()
                        withAnimation { isPressed = false }
                    }
                }
        )
    }
    
    private func getTitleText() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        
        let number = NSNumber(value: myNumber.number)
        
        if let spelledOutNumber = numberFormatter.string(from: number) {
            return spelledOutNumber.capitalized
        } else {
            return String(myNumber.number)
        }
    }
    
    private func getListRowBackground() -> some View {
        Color(UIColor.systemBackground)
            .overlay { getOverlayColor() }
            .ignoresSafeArea()
    }
    
    private func getOverlayColor() -> Color {
        if (isPressed || isTapped) {
            return Color.gray.opacity(0.5)
        } else {
            return Color.clear
        }
    }
    
    private func onTap() {
        print("\(getTitleText()) tapped")
    }
}

#Preview {
    List {
        MyNumberView(myNumber: MyNumber(1))
    }.listStyle(PlainListStyle())
}
