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
    
    nonisolated func executeOperation1() {
        print("Before 'Task' instantiation for Operation 1.")
        
        Task(priority: .userInitiated) {
            if (await !changeStateTo(.busy)) {
                print("Abandoned Operation 1 before starting. The view model is busy.")
                return
            }
            
            print("Starting Operation 1.")
            do {
                try await Task.sleep(for: .seconds(3))
            } catch {
                print("The 'Task.sleep' call in Operation 1 threw an error 🤷‍♂️")
            }
            print("Completed Operation 1.")
            
            if (await !changeStateTo(.free)) {
                print("Strange! Couldn't change the state back to free after ending Operation 1.")
                return
            }
        }
        
        print("After 'Task' instantiation for Operation 1.")
    }
    
    func executeOperation2() async {
        if (await !changeStateTo(.busy)) {
            print("Abandoned Operation 2 before starting. The view model is busy.")
            return
        }
        
        print("Starting Operation 2.")
        do {
            try await Task.sleep(for: .seconds(3))
        } catch {
            print("The 'Task.sleep' call in Operation 2 threw an error 🤷‍♂️")
        }
        print("Completed Operation 2.")
        
        if (await !changeStateTo(.free)) {
            print("Strange! Couldn't change the state back to free after ending Operation 2.")
            return
        }
    }
}
