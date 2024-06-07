//
//  ContentView.swift
//  App1
//
//  Created by Adil Hussain on 21/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Push Detail View", destination: DetailView())
                Button("Present Detail View") { showingSheet.toggle() }
                Spacer()
                    .sheet(isPresented: $showingSheet) { DetailSheetView() }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}
