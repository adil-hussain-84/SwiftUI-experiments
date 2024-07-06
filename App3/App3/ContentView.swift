//
//  ContentView.swift
//  App3
//
//  Created by Adil Hussain on 03/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    private let numbers = (1...10).map { MyNumber($0) }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                NavigationLink(
                    "Show list with default list style",
                    destination: ListExample(listStyle: DefaultListStyle(), numbers: numbers)
                )
                NavigationLink(
                    "Show list with plain list style",
                    destination: ListExample(listStyle: PlainListStyle(), numbers: numbers)
                )
                NavigationLink(
                    "Show list with inset list style",
                    destination: ListExample(listStyle: InsetListStyle(), numbers: numbers)
                )
                NavigationLink(
                    "Show list with grouped list style",
                    destination: ListExample(listStyle: GroupedListStyle(), numbers: numbers)
                )
                NavigationLink(
                    "Show list with sidebar list style",
                    destination: ListExample(listStyle: SidebarListStyle(), numbers: numbers)
                )
                Spacer()
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}
