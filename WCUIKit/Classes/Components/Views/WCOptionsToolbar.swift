//
//  WCOptionsToolbar.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 12/05/21.
//

import UIKit

public protocol WCOptionsToolbarDelegate: AnyObject {
    func optionsToolbar(selectedButton index: Int, optionsToolbar: WCOptionsToolbar)
}

public class WCOptionsToolbar: UIView {
    
    private enum Constants {
        static let selectionViewHeightValue: CGFloat = 4
        static let cellWidthMultiplier: CGFloat = 9
        static let cellHeight: CGFloat = 42
        static let padding: CGFloat = 6
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public weak var delegate: WCOptionsToolbarDelegate?
    private var optionNames: [String]?
    private var fixedWidthMode: Bool = false
    
    
}
