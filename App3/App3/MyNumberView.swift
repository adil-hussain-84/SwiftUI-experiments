//
//  MyNumberView.swift
//  App3
//
//  Created by Adil Hussain on 03/09/2021.
//

import SwiftUI

struct MyNumberView: View {
    
    var myNumber: MyNumber
    
    var body: some View {
        Text(myNumber.name)
            .font(.body)
            .padding()
    }
}

#Preview {
    MyNumberView(myNumber: MyNumber(name: "One"))
}
