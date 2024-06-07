//
//  ContentView.swift
//  App3
//
//  Created by Adil Hussain on 03/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    private let numbers = [
        MyNumber(name: "One"),
        MyNumber(name: "Two"),
        MyNumber(name: "Three"),
        MyNumber(name: "Four"),
        MyNumber(name: "Five"),
        MyNumber(name: "Six"),
        MyNumber(name: "Seven"),
        MyNumber(name: "Eight"),
        MyNumber(name: "Nine"),
        MyNumber(name: "Ten")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("LazyVStack Example", destination: LazyVStackExample(numbers))
                NavigationLink("List in VStack Example", destination: ListInVStackExample(numbers))
                NavigationLink("List Example", destination: ListExample(numbers))
                Spacer()
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}
