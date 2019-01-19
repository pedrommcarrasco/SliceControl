![](https://github.com/pedrommcarrasco/SliceControl/blob/master/logo.gif?raw=true)

> **Slice** *(/slɑɪs/)*, *noun*
>
> "A slice is any small part that has been separated from something larger"

🍰 Simply a better & animated `UISegmentedControl`

[![CocoaPods](https://img.shields.io/cocoapods/v/SliceControl.svg)](https://cocoapods.org/pods/SliceControl)
[![apm](https://img.shields.io/apm/l/vim-mode.svg)](https://github.com/pedrommcarrasco/Fluky/blob/master/LICENSE)

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

view.addSubview(sliceControl)
// ... Constrain it
```
You can also set its `UIFont` and starting option.


# Instalation 📦

**SliceControl** is available through [CocoaPods](https://cocoapods.org/pods/SliceControl). In order to install, add the following line to your Podfile:

```swift
pod 'SliceControl'
```
And run the following command in terminal:

```swift
pod install
```
