//
//  LazyVStackExperiment.swift
//  App3
//
//  Created by Adil Hussain on 03/09/2021.
//

import SwiftUI

struct LazyVStackExample: View {
    
    private let numbers: [MyNumber]
    
    init(_ numbers: [MyNumber]) {
        self.numbers = numbers
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                Text("Title")
                    .font(.title)
                    .onAppear { print("onAppear: Title") }
                    .onDisappear { print("onDisappear: Title") }
                Text("Subtitle")
                    .font(.title2)
                    .onAppear { print("onAppear: Subtitle") }
                    .onDisappear { print("onDisappear: Subtitle") }
                ForEach(numbers, id: \.self) { number in
                    MyNumberView(myNumber: number)
                        .onAppear { print("onAppear: \(number.name)") }
                        .onDisappear { print("onDisappear: \(number.name)") }
                }
            }
        }
        .navigationBarTitle("LazyVStack Example", displayMode: .inline)
    }
}

struct LazyVStackExperiment_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStackExample([MyNumber(name: "One")])
    }
}
