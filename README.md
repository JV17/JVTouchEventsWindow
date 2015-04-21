# JVTouchEventsWindow

[![Version](https://img.shields.io/cocoapods/v/JVTouchEventsWindow.svg?style=flat)](http://cocoapods.org/pods/JVTouchEventsWindow)
[![License](https://img.shields.io/cocoapods/l/JVTouchEventsWindow.svg?style=flat)](http://cocoapods.org/pods/JVTouchEventsWindow)
[![Platform](https://img.shields.io/cocoapods/p/JVTouchEventsWindow.svg?style=flat)](http://cocoapods.org/pods/JVTouchEventsWindow)

## Preview 1 - Menu with Background pic

<a href="http://www.youtube.com/watch?feature=player_embedded&v=s0cec4tZ5Ug?autoplay=1" target="_blank">![screenshot-1](Previews/preview1.gif)</a>

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

* Now, go to your AppDelegate.m file and add this simple function

```objc
- (JVTouchEventsWindow *)window
{
    static JVTouchEventsWindow *sharedWindow = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedWindow = [[JVTouchEventsWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    });

    return sharedWindow;
}
```

## Requirements

Developed and tested using iOS8+

## Installation

JVTouchEventsWindow is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JVTouchEventsWindow"
```

## Author & Support

Contact me if you find any bugs or potential room for improvements. Jorge Valbuena (@JV17), jorgevalbuena2@gmail.com. BTW! You are welcome to help in supporting this pod or making improvements to it.

## License

JVTouchEventsWindow is available under the MIT license. See the LICENSE file for more info.