//
//  NumbersInListExperiment.swift
//  App3
//
//  Created by Adil Hussain on 03/09/2021.
//

import SwiftUI

struct ListExample: View {
    
    private let numbers: [MyNumber]
    
    init(_ numbers: [MyNumber]) {
        self.numbers = numbers
    }
    
    var body: some View {
        VStack {
            Text("Title")
                .font(.title)
                .onAppear { print("onAppear: Title") }
                .onDisappear { print("onDisappear: Title") }
            Text("Subtitle")
                .font(.title2)
                .onAppear { print("onAppear: Subtitle") }
                .onDisappear { print("onDisappear: Subtitle") }
            List(numbers) { number in
                MyNumberView(myNumber: number)
                    .onAppear { print("onAppear: \(number.name)") }
                    .onDisappear { print("onDisappear: \(number.name)") }
            }
        }
        .navigationBarTitle("List Example", displayMode: .inline)
    }
}

struct ListExperiment_Previews: PreviewProvider {
    static var previews: some View {
        ListExample([MyNumber(name: "One")])
    }
}
