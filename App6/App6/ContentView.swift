//
//  ContentView.swift
//  App6
//
//  Created by Adil Hussain on 30/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Text(viewModel.stateLabel())
            
            Divider()
            
            Button("Execute Actor-Isolated\nAsynchronous Operation") {
                Task(priority: .userInitiated) {
                    await viewModel.executeActorIsolatedAsyncOperation()
                }
            }
            
            Divider()
            
            Button("Execute Nonisolated\nAsynchronous Operation") {
                Task(priority: .userInitiated) {
                    await viewModel.executeNonisolatedAsyncOperation()
                }
            }
            
            Divider()
            
            Button("Execute Concurrent\nAsynchronous Operation") {
                Task(priority: .userInitiated) {
                    await viewModel.executeConcurrentAsyncOperation()
                }
            }
            
            Divider()
            
            Button("Execute Actor-Isolated\nSynchronous Operation") {
                viewModel.executeActorIsolatedSynchronousOperation()
            }
            
            Divider()
            
            Button("Execute Nonisolated\nSynchronous Operation") {
                viewModel.executeNonisolatedSynchronousOperation()
            }
            
            Divider()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
