# SwiftUI Navigation Problem

This UIKit application demonstrates that a SwiftUI view which is presented (modally) within a [UIHostingController](https://developer.apple.com/documentation/swiftui/uihostingcontroller) cannot be dismissed programmatically.

This problem is particularly severe in landspace orientation because the modal takes up the full screen and cannot be dismissed by swiping down, as demonstrated below:

![Demo of application](App2Demo.gif)
