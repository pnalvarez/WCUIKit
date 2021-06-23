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

public class WCOptionsToolbar: WCUIView {
    
    private enum Constants {
        static let selectionViewHeightValue: CGFloat = 4
        static let cellWidthMultiplier: Int = 9
        static let cellHeight: CGFloat = 42
        static let padding: CGFloat = 6
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.registerCell(cellType: WCOptionsToolbarCollectionViewCell.self)
        view.backgroundColor = .white
        view.assignProtocols(to: self)
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    public weak var delegate: WCOptionsToolbarDelegate?
    private var optionNames: [String]?
    
    private var fixedWidthMode: Bool = false {
        didSet {
            collectionView.bounces = !fixedWidthMode
            collectionView.isScrollEnabled = !fixedWidthMode
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        applyViewCode()
    }

    public func setupToolbarLayout(optionNames: [String], fixedWidth: Bool = false) {
        self.optionNames = optionNames
        self.fixedWidthMode = fixedWidth
        applyViewCode()
        collectionView.reloadData()
        selectFirstItem()
    }
    
    public func selectFirstItem() {
        let indexPath = IndexPath(row: 0, section: 0)
        DispatchQueue.main.async {
            self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
            self.collectionView(self.collectionView, didSelectItemAt: indexPath)
        }
    }
}

extension WCOptionsToolbar: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return optionNames?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(indexPath: indexPath, type: WCOptionsToolbarCollectionViewCell.self)
        guard let option = optionNames?[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.setup(title: option)
        return cell
    }
}

extension WCOptionsToolbar: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.optionsToolbar(selectedButton: indexPath.row, optionsToolbar: self)
    }
}

extension WCOptionsToolbar: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if fixedWidthMode {
            let size = CGFloat(optionNames?.count ?? 1)
            let width = collectionView.frame.width/size - Constants.padding
            
            return CGSize(width: width, height: CGFloat(Constants.cellHeight))
        } else {
            let nameSize = optionNames?[indexPath.row].count ?? 0
            let cellWidth = nameSize * Constants.cellWidthMultiplier
            
            return CGSize(width: CGFloat(cellWidth), height: Constants.cellHeight)
        }
    }
}

extension WCOptionsToolbar: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(42)
        }
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.left.equalToSuperview().inset(10)
        }
    }
}


