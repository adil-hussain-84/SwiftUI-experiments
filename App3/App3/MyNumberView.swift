//
//  MyNumberView.swift
//  App3
//
//  Created by Adil Hussain on 03/09/2021.
//

import SwiftUI

struct MyNumberView: View {
    
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
            withAnimation {
                isTapped = true
            }
            
            print("\(myNumber.number) tapped")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    isTapped = false
                }
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation {
                        isPressed = true
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        isPressed = false
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
}

#Preview {
    List {
        MyNumberView(myNumber: MyNumber(1))
    }.listStyle(PlainListStyle())
}
