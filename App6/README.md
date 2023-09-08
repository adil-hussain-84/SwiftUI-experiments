# SwiftUI asynchronous operation example

This SwiftUI application demonstrates how to schedule asynchronous work when a [Button][1] is tapped.

Refer to the three Buttons in the [ContentView][4] struct. Each Button calls into a function of a [MainActor][2] view model via a [Task][3]. Each of the functions in the view model is declared as `nonisolated` or `async` or both.

[1]: https://developer.apple.com/documentation/swiftui/button
[2]: https://developer.apple.com/documentation/swift/mainactor
[3]: https://developer.apple.com/documentation/swift/task
[4]: App6/ContentView.swift
