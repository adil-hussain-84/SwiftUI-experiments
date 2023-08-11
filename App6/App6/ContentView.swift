//
//  ContentView.swift
//  App6
//
//  Created by Adil Hussain on 30/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Text(viewModel.stateLabel())
            
            Button("Execute Operation 1") {
                viewModel.executeOperation1()
            }
            
            Button("Execute Operation 2") {
                print("Before 'Task' instantiation for Operation 2.")
                
                Task {
                    await viewModel.executeOperation2()
                }
                
                print("After 'Task' instantiation for Operation 2.")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
