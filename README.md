# Times

You can easily run a codeblock once (or as many times you want) without having to track the status yourself. Times tracks the number of times the block gets executed and decides wheter to run or not on your preference.

## Installation

Times is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Times"
```

## Usage

```

Times.shared.once(forKey: "tutorial") {
  // This gets executed once unless the user deletes and reinstalls
}

Times.shared.twice(forKey: "tutorial") {
  // This gets executed two times unless the user deletes and reinstalls
}

Times.shared.times(8, forKey: "tutorial") {
  // This gets executed eight times unless the user deletes and reinstalls
}

Times.shared.onceForSession(forKey: "tutorial") {
  // This gets executed once. Count is zeroed when app restarts.
}

Times.shared.twiceForSession(forKey: "tutorial") {
  // This gets executed two times. Count is zeroed when app restarts.
}

Times.shared.timesForSession(8, forKey: "tutorial") {
  // This gets executed eight times. Count is zeroed when app restarts.
}

```

## Author
| [<img src="https://avatars1.githubusercontent.com/u/1448702?v=4" width="100px;"/>](http://okaris.com)   | [Omer Karisman](http://okaris.com)<br/><br/><sub>Lead UI/UX @ [MojiLaLa](http://mojilala.com)</sub><br/> [![Twitter][1.1]][1] [![Dribble][2.1]][2] [![Github][3.1]][3]|
| - | :- |

[1.1]: http://i.imgur.com/wWzX9uB.png (twitter icon without padding)
[2.1]: http://i.imgur.com/Vvy3Kru.png (dribbble icon without padding)
[3.1]: http://i.imgur.com/9I6NRUm.png (github icon without padding)

[1]: http://www.twitter.com/okarisman
[2]: http://dribbble.com/okaris
[3]: http://www.github.com/okaris

## License

Times is available under the MIT license. See the LICENSE file for more info.
