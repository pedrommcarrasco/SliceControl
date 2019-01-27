//
//  SliceControl.swift
//  SliceControl
//
//  Created by Pedro Carrasco on 17/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - SliceControl
public final class SliceControl: UIControl {
    
    // MARK: Private Outlets
    private let optionLabels: [UILabel]
    private let selectedView = UIView()
    private let stackView: UIStackView = .create {
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.isLayoutMarginsRelativeArrangement = true
    }
    
    private var selectedLeadingConstraint: NSLayoutConstraint?
    
    // MARK: Public Properties
    public var selectedIndex: Int {
        didSet {
            guard optionLabels.indices.contains(selectedIndex) else { return }
            animateSelection(for: optionLabels[selectedIndex])
        }
    }
    public weak var delegate: SliceControlDelegate?
    
    // MARK: Private Properties
    private let primaryColor: UIColor
    private let secondaryColor: UIColor
    private let padding: CGFloat
    private let startIndex: Int
    
    // MARK: Lifecycle
    public init(with options: [String],
                primaryColor: UIColor,
                secondaryColor: UIColor,
                font: UIFont? = nil,
                padding: CGFloat,
                startAt index: Int = 0) {
        
        self.optionLabels = options.map { return UILabel(with: $0, textColor: secondaryColor, font: font) }
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.padding = padding
        self.startIndex = index
        self.selectedIndex = index
        
        super.init(frame: .zero)
        
        configure(with: index)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        selectedView.withRoundedCorners()
    }
}

// MARK: - Actions
extension SliceControl {
    
    override public func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        guard let selectedLabel = optionLabels.first(where: { $0.frame.contains(location) }) else { return false }
        selected(item: selectedLabel)
        sendActions(for: .valueChanged)
        
        return false
    }
}

// MARK: - Configuration
private extension SliceControl {
    
    func configure(with startingIndex: Int) {
        addSubviews()
        defineConstraints(with: startingIndex)
        setupSubviews(with: startingIndex)
    }
    
    func addSubviews() {
        stackView.addArrangedSubviews(optionLabels)
        addSubviews(selectedView, stackView)
    }
    
    func defineConstraints(with startingIndex: Int) {
        stackView.topAnchor.constrain(to: topAnchor)
        stackView.bottomAnchor.constrain(to: bottomAnchor)
        stackView.leadingAnchor.constrain(to: leadingAnchor)
        stackView.trailingAnchor.constrain(to: trailingAnchor)

        selectedView.topAnchor.constrain(to: stackView.layoutMarginsGuide.topAnchor)
        selectedView.bottomAnchor.constrain(to: stackView.layoutMarginsGuide.bottomAnchor)
        selectedView.widthAnchor.constrain(to: stackView.layoutMarginsGuide.widthAnchor, multiplyBy: 1 / CGFloat(optionLabels.count))
        selectedLeadingConstraint = selectedView.leadingAnchor.constrain(to: optionLabels.element(forClamped: startingIndex).leadingAnchor)
    }
    
    func setupSubviews(with startingIndex: Int) {
        subviews.forEach { $0.isUserInteractionEnabled = false }
        backgroundColor = primaryColor
        selectedView.backgroundColor = secondaryColor
        optionLabels.element(forClamped: startingIndex).textColor = primaryColor
        stackView.layoutMargins = UIEdgeInsets(with: padding)
    }
}

// MARK: - Animation
private extension SliceControl {
    
    enum Animation {
        static let duration = 0.33
        static let delay: TimeInterval = 0.0
        static let damping: CGFloat = 0.7
        static let velocity: CGFloat = 0.7
    }
    
    func selected(item: UILabel) {
        guard let index = optionLabels.index(of: item) else { return }
        selectedIndex = index
        delegate?.sliceControl(self, didSelectItemAt: index)
    }
    
    func animateSelection(for item: UILabel) {
        updateLeadingContraint(with: item)
        let animation: () -> Void = { [weak self] in self?.layoutIfNeeded() }
        UIView.animate(withDuration: Animation.duration,
                       delay: Animation.delay,
                       usingSpringWithDamping: Animation.damping,
                       initialSpringVelocity: Animation.velocity,
                       options: .curveEaseOut,
                       animations: animation,
                       completion: nil)
        
        optionLabels.forEach { $0.textColor = secondaryColor }
        let textAnimation = { [weak self] in item.textColor = self?.primaryColor }
        UIView.transition(with: item,
                          duration: Animation.duration,
                          options: .transitionCrossDissolve,
                          animations: textAnimation,
                          completion: nil)
    }
    
    func updateLeadingContraint(with item: UILabel) {
        selectedLeadingConstraint?.isActive = false
        selectedLeadingConstraint = selectedView.leadingAnchor.constrain(to: item.leadingAnchor)
    }
}
