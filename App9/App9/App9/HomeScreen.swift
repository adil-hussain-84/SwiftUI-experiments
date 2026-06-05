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
            NavigationLink("Pager1", destination: Pager1())
            NavigationLink("Pager2", destination: Pager2())
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
