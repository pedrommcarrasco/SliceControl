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
    
    // MARK: Properties
    public weak var delegate: SliceControlDelegate?
    
    // MARK: Private Properties
    private let primaryColor: UIColor
    private let secondaryColor: UIColor
    private let padding: CGFloat
    private var selectedIndex: Int = 0

    // MARK: Private Constraints
    private var selectedLeadingConstraint: NSLayoutConstraint?
    
    // MARK: Lifecycle
    public init(with options: [String],
                primaryColor: UIColor,
                secondaryColor: UIColor,
                font: UIFont? = nil,
                padding: CGFloat,
                startAt index: Int) {
        
        self.optionLabels = options.map { return UILabel(with: $0, textColor: secondaryColor, font: font) }
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.padding = padding
        
        super.init(frame: .zero)
        
        configure()

        selected(item: optionLabels[clamp(index, minValue: 0, maxValue: optionLabels.count)])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        selectedView.layer.cornerRadius = selectedView.bounds.height / 2
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
    
    func selected(item: UILabel) {
        guard let index = optionLabels.index(of: item) else { return }
        selectedIndex = index
        animateSelection(for: item)
        delegate?.sliceControl(self, didSelectItemAt: selectedIndex)
    }
}

// MARK: - Configuration
private extension SliceControl {
    
    func configure() {
        addSubviews()
        defineConstraints()
        setupSubviews()
    }
    
    func addSubviews() {
        optionLabels.forEach { self.stackView.addArrangedSubview($0) }
        [selectedView, stackView].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func defineConstraints() {
        let selectedMultiplier = 1 / CGFloat(optionLabels.count)

        NSLayoutConstraint.activate(
            [
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                selectedView.topAnchor.constraint(equalTo: stackView.layoutMarginsGuide.topAnchor),
                selectedView.bottomAnchor.constraint(equalTo: stackView.layoutMarginsGuide.bottomAnchor),
                selectedView.widthAnchor.constraint(equalTo: stackView.layoutMarginsGuide.widthAnchor, multiplier: selectedMultiplier)
            ]
        )
        
        selectedLeadingConstraint = selectedView.leadingAnchor.constraint(equalTo: stackView.layoutMarginsGuide.leadingAnchor)
        selectedLeadingConstraint?.isActive = true
    }
    
    func setupSubviews() {
        subviews.forEach { $0.isUserInteractionEnabled = false }
        backgroundColor = primaryColor
        selectedView.backgroundColor = secondaryColor
        stackView.layoutMargins = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
}

// MARK: - Animation
private extension SliceControl {
    
    func animateSelection(for item: UILabel) {
        updateLeadingContraints(with: item)
        let animation: () -> Void = { [weak self] in self?.layoutIfNeeded() }
        UIView.animate(withDuration: 0.33,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.7,
                       options: .curveEaseOut,
                       animations: animation,
                       completion: nil)

        optionLabels.forEach { $0.textColor = secondaryColor }
        let textAnimation: () -> Void = { [weak self] in item.textColor = self?.primaryColor }
        UIView.transition(with: item,
                          duration: 0.33,
                          options: .transitionCrossDissolve,
                          animations: textAnimation,
                          completion: nil)
    }
}

// MARK: - Utils
private extension SliceControl {
    
    func updateLeadingContraints(with item: UILabel) {
        selectedLeadingConstraint?.isActive = false
        selectedLeadingConstraint = selectedView.leadingAnchor.constraint(equalTo: item.leadingAnchor)
        selectedLeadingConstraint?.isActive = true
    }

    func clamp(_ value: Int, minValue: Int, maxValue: Int) -> Int {
        return min(max(value, minValue), maxValue)
    }
}
