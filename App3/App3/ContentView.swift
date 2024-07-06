//
//  ContentView.swift
//  App3
//
//  Created by Adil Hussain on 03/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                NavigationLink(
                    "Show list with default list style",
                    destination: ListExample(listStyle: DefaultListStyle())
                )
                NavigationLink(
                    "Show list with plain list style",
                    destination: ListExample(listStyle: PlainListStyle())
                )
                NavigationLink(
                    "Show list with inset list style",
                    destination: ListExample(listStyle: InsetListStyle())
                )
                NavigationLink(
                    "Show list with grouped list style",
                    destination: ListExample(listStyle: GroupedListStyle())
                )
                NavigationLink(
                    "Show list with sidebar list style",
                    destination: ListExample(listStyle: SidebarListStyle())
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
