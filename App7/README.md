# StateObject initialisation example

## About

This SwiftUI application demonstrates how to initialise an [ObservableObject][1] as a [StateObject][2] in a View's `init` method.

Let's say you have declared an [ObservableObject][1] named `ContentViewModel` in your View as follows:

```swift
struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
}
```

Naturally, you will try and initialise `viewModel` in `ContentView`'s `init` method as follows:

```swift
init(someParam: SomeType) {
    viewModel = ContentViewModel(someParam: someParam)
}
```

When you try this, you'll get the following compilation error:

```none
Cannot assign to property: 'viewModel' is a get-only property
```

Fortunately, there's a workaround. See the [ContentView.swift][3] file in this project for the workaround.

[1]: https://developer.apple.com/documentation/combine/observableobject
[2]: https://developer.apple.com/documentation/swiftui/stateobject
[3]: App7/ContentView.swift
