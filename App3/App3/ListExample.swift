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
        List(1..<11) {
            MyNumberView(myNumber: MyNumber($0))
        }
        .listStyle(listStyle)
        .navigationBarTitle("List Example", displayMode: .inline)
    }
}

#Preview {
    ListExample(listStyle: PlainListStyle())
}
