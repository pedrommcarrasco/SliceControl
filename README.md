<p align="center">
    <img src="logo.gif?raw=true alt="SliceControl" width="100%"/>
</p>
                      
> **Slice** *(/slɑɪs/)*, *noun*
>
> "A slice is any small part that has been separated from something larger"

[![CocoaPods](https://img.shields.io/cocoapods/v/SliceControl.svg)](https://cocoapods.org/pods/SliceControl)
[![apm](https://img.shields.io/apm/l/vim-mode.svg)](https://github.com/pedrommcarrasco/SliceControl/blob/master/LICENSE)

# Usage Example ⌨️

After installing **SliceControl**, you should start by importing the framework:

```swift
import SliceControl
```

Once imported, you can start using **SliceControl** like follows:

```swift
sliceControl = SliceControl(with: ["All", "Liked", "Favourited"],
                            primaryColor: .darkGray,
                            secondaryColor: .white,
                            padding: 12)

// Implement SliceControlDelegate to intercept actions
sliceControl.delegate = self

view.addSubview(sliceControl)
// ... Constrain it
```
You can also set its `UIFont` and starting option.

## RxSwift
Would you like to subscribe to SliceControl's events using RxSwift? **[RxSliceControl](https://github.com/pedrommcarrasco/RxSliceControl)** is here to save you!

# Instalation 📦

**SliceControl** is available through [CocoaPods](https://cocoapods.org/pods/SliceControl). In order to install, add the following line to your Podfile:

```swift
pod 'SliceControl'
```
And run the following command in terminal:

```swift
pod install
```

# Sample Project  📲

There's a sample project in this repository called [Example](https://github.com/pedrommcarrasco/SliceControl/tree/master/Example).

# Support SliceControl ❤️

Hello there 👋

I’m Pedro, a Portuguese iOS Engineer since February 2017. I’m an avid OSS enthusiast and contributor - help by sharing, learn by what’s shared.

I've built and open-sourced multiple frameworks and applications, including **[Brooklyn](https://github.com/pedrommcarrasco/Brooklyn)** and **[CocoaHub](https://cocoahub.app)**.

I'm also a conference and meetup organizer, being part of **[SwiftAveiro](https://swiftaveiro.xyz)** and **[CocoaHeads Porto](https://www.meetup.com/CocoaHeads-Porto/)**.

If you enjoy my work and would like to help me continue it, please consider:
* https://www.buymeacoffee.com/pedrommcarrasco
* https://www.paypal.me/pedrommcarrasco

# Contributing  🙌 

Feel free to contribute to this project by providing [ideas](https://github.com/pedrommcarrasco/SliceControl/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc) or opening [pull requests](https://github.com/pedrommcarrasco/SliceControl/pulls?q=is%3Apr+is%3Aopen+sort%3Aupdated-desc).

# License ⛔

SliceControl's available under the MIT license. See the [LICENSE](https://github.com/pedrommcarrasco/SliceControl/blob/master/LICENSE) file for more information.
