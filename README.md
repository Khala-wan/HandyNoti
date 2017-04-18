# HandyNoti

[![CI Status](http://img.shields.io/travis/Kara-wan/HandyNoti.svg?style=flat)](https://travis-ci.org/Kara-wan/HandyNoti)
[![Version](https://img.shields.io/cocoapods/v/HandyNoti.svg?style=flat)](http://cocoapods.org/pods/HandyNoti)
[![License](https://img.shields.io/cocoapods/l/HandyNoti.svg?style=flat)](http://cocoapods.org/pods/HandyNoti)
[![Platform](https://img.shields.io/cocoapods/p/HandyNoti.svg?style=flat)](http://cocoapods.org/pods/HandyNoti)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- Swift 3.0+
- Xcode 8.2+

## Usage

``` swift
       #注册监听
       NotificationCenter.default.addHandyObserver(self, selector: #selector(callBack), name: "handy", object: nil)
       
       #注销监听
       NotificationCenter.default.removeHandyObserver(self)
```

## Installation

HandyNoti is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HandyNoti"
```

## Author

wansheng_ios@sina.com

## License

HandyNoti is available under the MIT license. See the LICENSE file for more info.
