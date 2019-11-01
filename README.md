[![](http://inspace.io/github-cover.jpg)](http://inspace.io)

# Introduction

**INSActivityIndicatorView** was written by **[Dawid Płatek](https://github.com/dader)** for **[inspace.io](http://inspace.io)**

# INSActivityIndicatorView

**INSActivityIndicatorView** is a customizable and lightweight implementation of activity indicator view for iOS.

<img src="https://raw.githubusercontent.com/inspace-io/INSActivityIndicatorView/master/INSActivityIndicatorView/Assets/demo.gif?token=AAARF4AVKGVNRZWZ3UI32XC5YVIMW" alt="Demo" width="375" />


## Features
- Customizable line width ✅
- Customizable timing function ✅
- Customizable animation duration ✅
- Custom colors support ✅
- Customizable using Interface Builder ✅

## Usage

### Creating an activity indicator

Basically, you should need to create an object representing indicator, add it to parent view, define the size/position and invoke `startAnimating` method.

```Swift
let indicatorView = INSActivityIndicatorView()
indicatorView.frame.size = CGSize(width: 60, height: 60)
indicatorView.center = view.center

view.addSubview(indicatorView)

indicatorView.startAnimating()
```

### Customization

You can customize the behaviour and style of **INSActivityIndicatorView**. All customization is handled by the properties listed below. If you need any further customization you can even subclass the main class.

#### `lineWidth`

The width of the indicator borderline. It **can** be changed using Interface Builder.

_Default: `3.0`_

#### `animationDuration`

The duration of the single, full cycle of rotation animation. It **can** be changed using Interface Builder.

_Default: `1.0`_

#### `timingFunction`

The timing fucation used by internal `CABasicAnimation` instance. It **cannot** be changed using Interface Builder.

_Default: `CAMediaTimingFunction(name: .linear)`_

#### `primaryColor`

The color of foreground layer. It **can** be changed using Interface Builder.

_Default: `UIColor.black`_

#### `secondaryColor`

The color of background layer. It **can** be changed using Interface Builder.

_Default: `UIColor.black.withAlphaComponent(0.3)`_

## Installation

**INSActivityIndicatorView** will be compatible with the lastest public release of Swift.

### CocoaPods

**INSActivityIndicatorView** is available through [CocoaPods](https://cocoapods.org). To install it, add the following to your `Podfile`:

`pod 'INSActivityIndicatorView'`

## Requirements

* iOS 8.0+
* Xcode 8.0+

## Licence

INSActivityIndicatorView is released under the MIT license. See LICENSE for details.
