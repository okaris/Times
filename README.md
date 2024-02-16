# Times

Easily execute a code block once or a specified number of times without manually tracking its execution. Times handles the execution count and conditionally runs the block based on your criteria, with support for both persistent and session-based tracking.

<img width="312" alt="image" src="https://github.com/okaris/Times/assets/1448702/cc1daa08-7557-415b-aa20-234d2ee3cbe9">

## Installation

### Swift Package Manager

You can add Times to your project via Swift Package Manager by adding the following to your `Package.swift` file in the `dependencies` array:

```swift
.package(url: "https://github.com/okaris/Times.git", .upToNextMajor(from: "2.0.0"))

## Usage

The Times package provides a fluent API to schedule the execution of code blocks based on the number of times they have been run. Here are some examples:


```
// Run a block once (persistent across app launches)
Times.once.perform {
  // This block gets executed once unless the user deletes and reinstalls the app.
}

// Run a block once per session
Times.onceForSession.perform {
  // This block gets executed once per app session.
}

// Run a block a specific number of times
Times.t(3).perform {
  // This block gets executed up to three times, persistent across app launches.
}

// Run a block a specific number of times per session
Times.t(2, scope: .session).perform {
  // This block gets executed up to two times per session.
}


```

## License

Times is available under the MIT license. See the LICENSE file for more info.
