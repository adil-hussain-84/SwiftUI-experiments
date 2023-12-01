//
//  ContentViewModel.swift
//  App6
//
//  Created by Adil Hussain on 30/07/2023.
//

import Foundation

@MainActor class ContentViewModel: ObservableObject {
    
    @Published private var state = State.free
    
    private var numberOfBusyToFreeStateTransitions = 1
    
    func stateLabel() -> String {
        let ordinal = numberOfBusyToFreeStateTransitions.toOrdinal()
        
        switch state {
        case .free: return "Awaiting \(ordinal) button tap"
        case .busy: return "Processing \(ordinal) button tap"
        }
    }
    
    /// This function is declared as `async` because it makes a call that requires an `await`.
    /// It is declared without the `nonisolated` keyword so that it can access methods isolated to this actor without an `await`.
    func executeActorIsolatedAsyncOperation() async {
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
    /// it makes a longstanding blocking call (i.e. the `sleep` call).
    /// It requires an  `await` to access methods isolated to this actor because it is `nonisolated`.
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
    func executeActorIsolatedSynchronousOperation() {
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
    
    /// This function is declared as `nonisolated` because it does not access any methods or properties isolated to this actor.
    /// It is declared without the `async` keyword because it makes no calls that require an `await` and it makes no longstanding blocking calls.
    nonisolated func executeNonisolatedSynchronousOperation() {
        print("Op 4 ==> Starting <== Op 4")
        print("Op 4 ==> Completed <== Op 4")
    }
    
    private func changeStateTo(_ newState: State) -> Bool {
        if (state != newState) {
            if (newState == .free) { numberOfBusyToFreeStateTransitions += 1 }
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

extension Int {
    func toOrdinal() -> String {
        switch (self) {
        case 1: return "1st"
        case 2: return "2nd"
        default: return "\(self)th"
        }
    }
}
