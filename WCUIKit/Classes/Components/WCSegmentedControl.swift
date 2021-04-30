//
//  WCSegmentedControl.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 25/04/21.
//

import UIKit

@available(iOS 13.0, *)
public protocol WCSegmentedControlDelegate: class {
    func didChangeSelectedSegment(segmentedControl: WCSegmentedControl, selectedIndex: Int)
}

@available(iOS 13.0, *)
public class WCSegmentedControl: UISegmentedControl {
    
    public weak var delegate: WCSegmentedControlDelegate?
    
    public var criterias: [String] = [] {
        didSet {
            for i in 0..<criterias.count {
                insertSegment(withTitle: criterias[i], at: i, animated: false)
            }
            selectedSegmentIndex = 0
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        tintColor = ThemeColors.c4c4c4.rawValue
        selectedSegmentTintColor = ThemeColors.whiteThemeColor.rawValue
        layer.cornerRadius = 8
        clipsToBounds = true
        addTarget(self, action: #selector(didChangeSelectedSegment), for: .valueChanged)
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor: ThemeColors.hex969494.rawValue, NSAttributedString.Key.font: ThemeFonts.RobotoBold(16).rawValue], for: .normal)
    }
    
    @objc
    private func didChangeSelectedSegment() {
        delegate?.didChangeSelectedSegment(segmentedControl: self, selectedIndex: selectedSegmentIndex)
    }
}

