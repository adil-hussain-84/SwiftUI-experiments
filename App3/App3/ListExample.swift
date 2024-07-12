//
//  ListExample.swift
//  App3
//
//  Created by Adil Hussain on 03/09/2021.
//

import SwiftUI

struct ListExample<LS>: View where LS: ListStyle {
    
    let listStyle: LS
    
    var body: some View {
        List {
            Section("One to Five") {
                ForEach(1..<6) { number in
                    MyNumberView(myNumber: MyNumber(number))
                }
            }
            Section("Six to Ten") {
                ForEach(6..<11) { number in
                    MyNumberView(myNumber: MyNumber(number))
                }
            }
        }
        .listStyle(listStyle)
        .navigationBarTitle("List Example", displayMode: .inline)
    }
}

#Preview("Default list style") {
    ListExample(listStyle: DefaultListStyle())
}

#Preview("Plain list style") {
    ListExample(listStyle: PlainListStyle())
}
