//
//  ContentViewModel.swift
//  App6
//
//  Created by Adil Hussain on 30/07/2023.
//

import Foundation

@MainActor class ContentViewModel: ObservableObject {
    
    @Published var state = State.free
    
    enum State {
        case free
        case busy
    }
    
    func stateLabel() -> String {
        switch state {
        case .free: return "Awaiting button tap"
        case .busy: return "Processing button tap"
        }
    }
    
    func changeStateTo(_ newState: State) async -> Bool {
        if (state != newState) {
            state = newState
            return true
        } else {
            return false
        }
    }
    
    nonisolated func executeOperation() {
        print("Before 'Task' instantiation")
        
        Task(priority: .userInitiated) {
            if (await !changeStateTo(.busy)) {
                print("Abandoning Task. The view model is busy.")
                return
            }
            
            print("Starting Task")
            do {
                try await Task.sleep(for: .seconds(3))
            } catch {
                print("The 'Task.sleep' call threw an error 🤷‍♂️")
            }
            print("Ending Task")
            
            if (await !changeStateTo(.free)) {
                print("Strange! Couldn't change the state back to free.")
                return
            }
        }
        
        print("After 'Task' instantiation")
    }
}
