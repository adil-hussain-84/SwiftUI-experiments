//
//  ListExample.swift
//  App3
//
//  Created by Adil Hussain on 03/09/2021.
//

import SwiftUI

struct ListExample<LS>: View where LS: ListStyle {
    
    let listStyle: LS
    let numbers: [MyNumber]
    
    var body: some View {
        List() {
            ForEach(numbers, id: \.self) { number in
                MyNumberView(myNumber: number)
                    .onAppear { print("onAppear: \(number.number)") }
                    .onDisappear { print("onDisappear: \(number.number)") }
            }
        }
        .listStyle(listStyle)
        .navigationBarTitle("List Example", displayMode: .inline)
    }
}

#Preview {
    ListExample(listStyle: PlainListStyle(), numbers: [MyNumber(1)])
}
