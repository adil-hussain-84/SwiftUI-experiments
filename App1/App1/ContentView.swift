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
                NavigationLink(destination: DetailView()) {
                    Text("Push detail view")
                }
                Button("Present detail view") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    DetailView()
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
