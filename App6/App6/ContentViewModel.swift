//
//  ContentViewModel.swift
//  App6
//
//  Created by Adil Hussain on 30/07/2023.
//

import Foundation

@MainActor class ContentViewModel: ObservableObject {
    
    @Published private var state = State.free
    
    func stateLabel() -> String {
        switch state {
        case .free: return "Awaiting button tap"
        case .busy: return "Processing button tap"
        }
    }
    
    /// This function is declared as `async` because it makes a call that requires an `await`.
    /// It makes no longstanding blocking calls so it doesn't need to be declared as `nonisolated`.
    func executeIsolatedAsyncOperation() async {
        if (!changeStateTo(.busy)) {
            print("Op 1 ==> Abandoned before starting; The view model is busy <== Op 1")
            return
        }
        
        print("Op 1 ==> Starting <== Op 1")
        do {
            try await Task.sleep(for: .seconds(3))
        } catch {
            print("Op 1 ==> The 'Task.sleep' call threw an error <== Op 1")
        }
        print("Op 1 ==> Completed <== Op 1")
        
        if (!changeStateTo(.free)) {
            print("Op 1 ==> Strange! Couldn't change the state back to free after completion <== Op 1")
            return
        }
    }
    
    /// This function is declared as `nonisolated` and `async` because
    /// it makes a longstanding blocking call (i.e. the `sleep` call) and it makes calls that requires an `await`.
    nonisolated func executeNonisolatedAsyncOperation() async {
        if await (!changeStateTo(.busy)) {
            print("Op 2 ==> Abandoned before starting; The view model is busy <== Op 2")
            return
        }
        
        print("Op 2 ==> Starting <== Op 2")
        sleep(3) // this call blocks the underlying thread
        print("Op 2 ==> Completed <== Op 2")
        
        if await (!changeStateTo(.free)) {
            print("Op 2 ==> Strange! Couldn't change the state back to free after completion <== Op 2")
            return
        }
    }
    
    /// This function is declared without the `async` and `nonisolated` keywords because
    /// it makes no calls that require an `await` and it makes no longstanding blocking calls.
    func executeIsolatedSynchronousOperation() {
        if (!changeStateTo(.busy)) {
            print("Op 3 ==> Abandoned before starting; The view model is busy <== Op 3")
            return
        }
        
        print("Op 3 ==> Starting <== Op 3")
        print("Op 3 ==> Completed <== Op 3")
        
        if (!changeStateTo(.free)) {
            print("Op 3 ==> Strange! Couldn't change the state back to free after completion <== Op 3")
            return
        }
    }
    
    private func changeStateTo(_ newState: State) -> Bool {
        if (state != newState) {
            state = newState
            return true
        } else {
            return false
        }
    }
    
    private enum State {
        case free
        case busy
    }
}
