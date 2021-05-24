# SwiftUI Navigation Problem

This UIKit application demonstrates that a SwiftUI view which is presented (modally) within a [UIHostingController](https://developer.apple.com/documentation/swiftui/uihostingcontroller) cannot be dismissed programmatically.

This problem is particularly severe in landspace orientation because the modal takes up the full screen and cannot be dismissed by swiping down, as demonstrated below:

<img src="App2Demo.gif" alt="Demo of application" width="30%" height="30% "/>

##### Useful Links

1. See [here](https://feedbackassistant.apple.com/feedback/9116652) for a discussion in Apple's Feedback Assistant about this problem.
2. See [here](https://stackoverflow.com/q/57190511) for a discussion in StackOverflow about this problem.
