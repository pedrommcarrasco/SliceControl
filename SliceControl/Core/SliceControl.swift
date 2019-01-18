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
    
    // MARK: Default
    private enum Default {
        static let shadowRadius: CGFloat = 8.0
        static let shadownOpacity: Float = 0.25
        static let shadowOffset = CGSize(width: 0, height: 8.0)
        static let insets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    // MARK: Private Outlets
    private let optionLabels: [UILabel]?
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
    private var selectedIndex: Int = 0
    
    // MARK: Public Modifiers
    public var shadowRadius: CGFloat = 0.0 {
        didSet { layer.shadowRadius = shadowRadius }
    }
    
    public var shadowOffset: CGSize = .zero {
        didSet { layer.shadowOffset = shadowOffset }
    }
    
    public var shadowOpacity: Float = 0.0 {
        didSet { layer.shadowOpacity = shadowOpacity }
    }
    
    public var insets: UIEdgeInsets = .zero {
        didSet {
            stackView.layoutMargins = insets
            layoutIfNeeded()
        }
    }
    
    public var font: UIFont? {
        didSet {
            guard let font = font else { return }
            optionLabels?.forEach { $0.font = font }
            layoutIfNeeded()
        }
    }
    
    // MARK: Private Constraints
    private var selectedLeadingConstraint: NSLayoutConstraint?
    
    // MARK: Lifecycle
    init(with options: [String],
         axis: NSLayoutConstraint.Axis = .horizontal,
         primaryColor: UIColor,
         secondaryColor: UIColor) {
        
        self.optionLabels = options.map { return UILabel(with: $0) }
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.stackView.axis = axis
        
        super.init(frame: .zero)
        
        configure()
        
        defer {
            shadowRadius = Default.shadowRadius
            shadowOffset = Default.shadowOffset
            shadowOpacity = Default.shadownOpacity
            insets = Default.insets
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        animateSelection(at: selectedIndex)
    }
}

// MARK: - Actions
extension SliceControl {
    
    override public func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        
        guard let selectedLabel = optionLabels?.first(where: { $0.frame.contains(location) }) else { return false }
        selected(item: selectedLabel)
        sendActions(for: .valueChanged)
        
        return false
    }
    
    func selected(item: UILabel) {
        guard let index = optionLabels?.index(of: item) else { return }
        selectedIndex = index
        animateSelection(at: selectedIndex)
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
        optionLabels?.forEach { self.stackView.addArrangedSubview($0) }
        [stackView, selectedView].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
    }
    
    func defineConstraints() {
        
        let selectedMultiplier = 1 / CGFloat(optionLabels?.count ?? 1)
        
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
        
        configureLabelsIfNeeded()
        configureImageViewsIfNeeded()
        configureSelectedView()
    }
}

// MARK: - Subviews' Configuration
private extension SliceControl {
    
    func configureLabelsIfNeeded() {
        
        
    }
    
    func configureImageViewsIfNeeded() {
        
        
    }
    
    func configureSelectedView() {
        selectedView.backgroundColor = secondaryColor
    }
}

// MARK: - Animation
private extension SliceControl {
    
    func animateSelection(at index: Int) {
        selectedLeadingConstraint?.constant = leadingValue(at: index)
        let animation: () -> Void = { [weak self] in self?.layoutIfNeeded() }
        UIView.animate(withDuration: 0.33,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.7,
                       options: .curveEaseOut,
                       animations: animation,
                       completion: nil)
        
        guard let selectedLabel = optionLabels?[index] else { return }
        optionLabels?.forEach { $0.textColor = secondaryColor }
        let textAnimation: () -> Void = { [weak self] in selectedLabel.textColor = self?.primaryColor }
        UIView.transition(with: selectedLabel,
                          duration: 0.33,
                          options: .transitionCrossDissolve,
                          animations: textAnimation,
                          completion: nil)
    }
}

// MARK: - Utils
private extension SliceControl {
    
    func leadingValue(at index: Int) -> CGFloat {
        return (((stackView.bounds.width - (insets.left * 2)) / CGFloat(optionLabels?.count ?? 0)) * CGFloat(index)) + insets.left
    }
}

