//
//  HomeView.swift
//  App7
//
//  Created by Adil Hussain on 17/11/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Home View")
            ContentView(name: "Adil")
        }.padding()
    }
}

#Preview {
    HomeView()
}
