# JVTouchEventsWindow

[![Version](https://img.shields.io/cocoapods/v/JVTouchEventsWindow.svg?style=flat)](http://cocoapods.org/pods/JVTouchEventsWindow)
[![License](https://img.shields.io/cocoapods/l/JVTouchEventsWindow.svg?style=flat)](http://cocoapods.org/pods/JVTouchEventsWindow)
[![Platform](https://img.shields.io/cocoapods/p/JVTouchEventsWindow.svg?style=flat)](http://cocoapods.org/pods/JVTouchEventsWindow)

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

## Installation

JVTouchEventsWindow is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JVTouchEventsWindow"
```

## Author

Jorge Valbuena, jorgevalbuena2@gmail.com

## License

JVTouchEventsWindow is available under the MIT license. See the LICENSE file for more info.
