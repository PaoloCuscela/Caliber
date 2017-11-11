<p align="center">
    <a href="https://github.com/PaoloCuscela/Caliber/stargazers">
        <img src="https://img.shields.io/github/stars/PaoloCuscela/Caliber.svg"
            alt="GitHub Stars"></a>
    <a href="http://cocoadocs.org/docsets/Caliber/">
        <img src="https://img.shields.io/cocoapods/v/Caliber.svg?style=flat"
            alt="Pod Version"></a>
    <a href="http://cocoadocs.org/docsets/Caliber">
        <img src="https://img.shields.io/cocoapods/p/Caliber.svg?style=flat"
            alt="Platform"></a>
    <a href="https://github.com/PaoloCuscela/Caliber/blob/master/LICENSE">
        <img src="https://img.shields.io/github/license/PaoloCuscela/Caliber.svg"
            alt="License"></a>
</p>

![Overview](https://raw.githubusercontent.com/PaoloCuscela/Caliber/master/Images/Header.png)

<p align="center"> <b>Implementing autolayout constrains programmatically made dead simple.</b></p> 

## Getting Started

```swift
import Caliber

// Setup view and add to a superview.

let aView = UIView()
aView.backgroundColor = UIColor.red
view.addSubview(aView)
    
// Add Constraints

aView.caliber   .top(with: view, .top)
                .centerHorizontally(in: view)
                .width = 100
    
aView.caliber.aspect = 16/9
    
// That's All. 
```

![GetStarted](https://raw.githubusercontent.com/PaoloCuscela/Caliber/master/Images/GetStarted.png)

## Prerequisites

- **Xcode 9.0** or newer
- **Swift 4.0**

## Installation

### CocoaPods
```
use_frameworks!
pod 'Caliber'
```
### Manual
- **Download** the repo
- ⌘C ⌘V the **Caliber.swift** file into your project
- In your **Project's Info** go to '**Build Phases**'
- Open '**Compile Sources**' and **add Caliber.swift** 

## License

Cards is released under the [MIT License](LICENSE).
