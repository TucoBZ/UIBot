# UIBot

[![CI Status](https://img.shields.io/travis/TucoBZ/UIBot.svg?style=flat)](https://travis-ci.org/TucoBZ/UIBot)
[![Version](https://img.shields.io/cocoapods/v/UIBot.svg?style=flat)](https://cocoapods.org/pods/UIBot)
[![License](https://img.shields.io/cocoapods/l/UIBot.svg?style=flat)](https://cocoapods.org/pods/UIBot)
[![Platform](https://img.shields.io/cocoapods/p/UIBot.svg?style=flat)](https://cocoapods.org/pods/UIBot)

UIBot helps you to easily build UI Robot framework to UI Test your code.

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- Swift 5.0
- iOS 9.0+

## Installation

UIBot is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UIBot', '~> 0.3.0'
```

**Remember**: This pod is only needed at UITest Target.


# Fundamentals
## Robot Framework
The Robot framework discribes that you can interact with your Controller step-by-step, like:

    - touch a button;
    - write a text;
    - wait a information;
    - assert a text;
    etc...

Eventually you will have a Robot for each of your controllers, and you need to discribe how you can interact with each one.


## What UIBot do?
Well, UIBot gives you a lot of ready to use interations in your Controller Robot, like taps, scrolls, asserts, waits, and so on.


## What I need to use UIBot?
First of all, this only works into native UIKit views, because it uses native predicates to find your view to interact with it. Futhermore, you will need to add `accessibilityIdentifier` to the components you want to interact to be easy to find them in code.


# UIBot Concepts
Every Controller will need a `Bot`, that being said, you can create a class that represents your controller Asserts and Interactions, by subclassing it as `Bot`.

Every `Bot` needs a `trait`, a `XCUIElement` that represents this Controller, when this element is on screen you know your controller is on screen.

To do it a `Bot` needs a `XCUITest` and a `XCUIApplication`, to assert and trigger Interations on every element on screen. You do it passing a `Bottable` on the Robot init. When you init a `Bot`, it will check for `trait` element on screen, when the element is found you can trigger asserts and actions from it.

As you can see, you need to init a `Bot` to determine whenever this screen is opened in your interaction flow. 
Finally, the tests will look like the following:

```swift
Controller1Bot(test: Bottable)  //As Controller1 on screen
    .interaction1()             //trigger interation
    .assert()                   //do some assert
    .interaction2()             //trigger other interaction

Controller2Bot(test: Bottable)  //It opens the Controller2 
    .assert()                   //do some assert
    .interaction()              //trigger interation

Controller1Bot(test: Bottable)  //this goes back to the Controller1
...
```

Look at Example tests to understand how it is done.

And remember that you need to start your test at the correct controller as a setUp. 

## UIBot interations
Some actions availables in a `Bot`:

- Native Alert asserts and tap buttons;
- Custom Asserts to text, images, buttons, etc...
- Taps a cell, button, text, cordinate, etc...
- Write in a TextField and assert texts on TextFields
- Custom waiting for elements
- and more...

You can create your on interaction in your `Bot`, it is a good pratice, after every assert or interaction function you return `Self` as `@discardableResult` to create the flow as presented before.


## Author

TucoBZ, tucobz@gmail.com

## License

UIBot is available under the MIT license. See the LICENSE file for more info.
