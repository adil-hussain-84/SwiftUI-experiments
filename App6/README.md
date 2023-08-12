# SwiftUI asynchronous operation example

This SwiftUI application demonstrates two different techniques for scheduling asynchronous work when a [Button][1] is tapped.

In both techniques the Button calls into a function of a [MainActor][2] view model.

In the first technique, the view model's function is declared as `nonisolated` and it takes on the responsibility of instantiating the [Task][3] that carries out the asynchronous work.

In the second technique, the view model's function is declared as `async` and it is the Button which instantiates the [Task][3] that carries out the asynchronous work.

Refer to the Buttons in the [ContentView][4] struct for the entry point of the two different techniques. 

[1]: https://developer.apple.com/documentation/swiftui/button
[2]: https://developer.apple.com/documentation/swift/mainactor
[3]: https://developer.apple.com/documentation/swift/task
[4]: App6/ContentView.swift
