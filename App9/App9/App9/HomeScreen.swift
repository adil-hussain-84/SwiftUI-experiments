//
//  HomeScreen.swift
//  App9
//
//  Created by Adil Hussain on 23/12/2025.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        VStack {
            NavigationLink("Pager", destination: Pager())
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    NavigationStack {
        HomeScreen()
    }
}
