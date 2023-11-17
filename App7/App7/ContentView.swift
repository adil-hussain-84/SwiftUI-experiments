//
//  ContentView.swift
//  App7
//
//  Created by Adil Hussain on 17/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ContentViewModel
    
    init(name: String) {
        _viewModel = StateObject(wrappedValue: ContentViewModel(name: name))
    }
    
    var body: some View {
        Text(viewModel.greeting)
    }
}

#Preview {
    ContentView(name: "Adil")
}
