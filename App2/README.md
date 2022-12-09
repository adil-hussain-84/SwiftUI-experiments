# SwiftUI Navigation Problem

This UIKit application demonstrates that a SwiftUI view which is presented (modally) within a [UIHostingController](https://developer.apple.com/documentation/swiftui/uihostingcontroller) cannot be dismissed programmatically in iOS 14 and older devices.

This problem is particularly severe in landspace orientation because the modal takes up the full screen and cannot be dismissed by swiping down, as demonstrated below:

<img src="App2Demo.gif" alt="Demo of application" width="30%" height="30%" />

The issue was resolved in iOS 15. If you need present a SwiftUI view within a [UIHostingController](https://developer.apple.com/documentation/swiftui/uihostingcontroller), you're best setting your target's `IPHONEOS_DEPLOYMENT_TARGET` Build Setting to `15.0` or higher.

#### Links

1. See [here](https://openradar.appspot.com/radar?id=5002685988208640) for an OpenRadar copy of the bug report which I submitted to Apple's Feedback Assistant about this problem.
2. See [here](https://stackoverflow.com/q/57190511) for a discussion in StackOverflow about this problem.
