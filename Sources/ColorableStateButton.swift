//
//  ColorableStateButton.swift
//  ColorableStateButton
//
//  Created by GeorgyHK on 19.07.2024.
//

// A custom UIButton subclass with customizable background and tint colors for different control states, a scaling animation on touch, and haptic feedback.

import UIKit

@objc public class INButton: UIButton {
    
    // MARK: - State Properties
    
    /// A dictionary storing background colors for each control state.
    private var backgroundColors = [UIControl.State.RawValue: UIColor]()
    
    /// A dictionary storing tint colors for each control state.
    private var tintColors = [UIControl.State.RawValue: UIColor]()
    
    // MARK: - Animation Properties
    
    /// The duration of the scaling animation in seconds
    private let animationDuration: TimeInterval = 0.15
    
    /// The scale factor applied to the button's transform during the animation.
    private let scaleFactor: CGFloat = 0.95
    
    /// The haptic feedback generator used for touch feedback.
    private let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
    
    // MARK: - State Overrides
    
    @objc public override var isHighlighted: Bool {
        didSet {
            updateAppearance()
        }
    }
    
    @objc public override var isEnabled: Bool {
        didSet {
            updateAppearance()
        }
    }
    
    @objc public override var isSelected: Bool {
        didSet {
            updateAppearance()
        }
    }
    
    // MARK: - Animation Overrides
    
    @objc public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animateDown()
        
        impactFeedbackgenerator.impactOccurred()
    }
    
    @objc public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animateUp()
    }
    
    @objc public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animateUp()
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    
    /// Sets up the default appearance of the button.
    private func setup() {
        
        // Initial values for Normal
        backgroundColors[UIControl.State.normal.rawValue] = .white
        tintColors[UIControl.State.normal.rawValue] = .blue
        
        // Initial values for Highlighted
        backgroundColors[UIControl.State.highlighted.rawValue] = .lightGray
        tintColors[UIControl.State.highlighted.rawValue] = .darkGray
        
        // Initial values for Selected
        backgroundColors[UIControl.State.selected.rawValue] = .white
        tintColors[UIControl.State.selected.rawValue] = .blue
        
        // Initial values for Disabled
        backgroundColors[UIControl.State.disabled.rawValue] = .lightGray
        tintColors[UIControl.State.disabled.rawValue] = .darkGray
    }
    
    // MARK: - Public Methods
    
    /// Sets the background color for a specific control state.
    ///
    /// - Parameters:
    ///   - color: The background color to set.
    ///   - state: The control state for which to set the color.
    @objc public func setBackgroundColor(color: UIColor, forState state: UIControl.State) {
        backgroundColors[state.rawValue] = color
        updateAppearance()
    }
    
    /// Sets the tint color for a specific control state.
    ///
    /// - Parameters:
    ///   - color: The tint color to set.
    ///   - state: The control state for which to set the color.
    @objc public func setTintColor(color: UIColor, for state: UIControl.State) {
        tintColors[state.rawValue] = color
        updateAppearance()
    }
    
    // MARK: - Appearance Methods
    
    /// Updates the button's appearance based on the current control state.
    private func updateAppearance() {
        backgroundColor = backgroundColors[state.rawValue] ?? backgroundColor
        tintColor = tintColors[state.rawValue] ?? tintColor
    }
    
    // MARK: - Animation Methods
    
    /// Animates the button scaling down.
    private func animateDown() {
        UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseOut]) {
            self.transform = CGAffineTransform(scaleX: self.scaleFactor, y: self.scaleFactor)
        }
    }
    
    /// Animates the button scaling back up.
    private func animateUp() {
        UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseIn]) {
            self.transform = .identity
        }
    }
}


