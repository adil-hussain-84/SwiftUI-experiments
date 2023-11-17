//
//  ContentView.swift
//  App7
//
//  Created by Adil Hussain on 17/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel: ContentViewModel
    
    init(name: String) {
        viewModel = ContentViewModel(name: name)
    }
    
    var body: some View {
        Text(viewModel.greeting)
    }
}

#Preview {
    ContentView(name: "Adil")
}
