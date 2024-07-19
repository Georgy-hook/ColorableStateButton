## **ColorableStateButton**
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://swift.org)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)](https://developer.apple.com/ios)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
A lightweight Swift UIButton subclass that adds customizable touch animations and haptic feedback.

## **Demonstration**
<img width="200" alt="Main view gif demonstration" src="https://github.com/user-attachments/assets/a5e48431-ea31-4215-97d8-05b0a5c313f3">

## **Stack**
SPM, Swift 5, UIKit

## Features

- **Customizable states:** Set different background and tint colors for various control states (normal, highlighted, selected, disabled).
- **Smooth Animations:**  Provides a built-in scaling animation on touch for engaging visual feedback.
- **Haptic Feedback:** Integrates haptic feedback on touch to enhance the user experience.
- **Easy to Use:**  Drop-in replacement for UIButton with a simple API.

## **Usage**
1. Import lib
  ```swift
import ColorableStateButton
  ```
2. Add button and configure
  ```swift
   private lazy var button: ColorableStateButton = {
        let button = ColorableStateButton()
        
        button.layer.cornerRadius = 6

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(.lamp, for: .normal)
        button.setImage(.map, for: [.selected, .highlighted])
        button.setImage(.map, for: .selected)
        button.setImage(.lamp, for: .highlighted)
        
        button.setBackgroundColor(color: .lightGray, forState: .normal)
        button.setBackgroundColor(color: .lightGray, forState: .selected)
        button.setBackgroundColor(color: .red, forState: [.selected, .highlighted])
        button.setBackgroundColor(color: .red, forState: .highlighted)
        
        button.setTintColor(color: .black, for: .normal)
        button.setTintColor(color: .black, for: .selected)
        button.setTintColor(color: .white, for: [.selected, .highlighted])
        button.setTintColor(color: .white, for: .highlighted)
        
        return button
    }()
  ```
## **Technical requirements**

- To run, you need an iPhone with iOS 14 or higher, only portrait mode is provided;
