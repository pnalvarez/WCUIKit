//
//  CathegoryListView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 14/04/21.
//

import UIKit

public protocol WCCathegoryListViewDelegate: AnyObject {
    func didSelectCathegory(atIndex index: Int)
}

public class WCCathegoryListView: WCUIView {
    
    private enum Constants {
        static let height: CGFloat = 479
        static let cathegoryHeight: CGFloat = 87
        static let cathegoryWidth: CGFloat = 3.7
        static let horizontalMargin: CGFloat = 26
        static let minimumLineSpacing: CGFloat = 10
        static let interItemSpacing: CGFloat = 4
    }
    
    private var cathegories: [String]? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.layoutIfNeeded()
            }
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.assignProtocols(to: self)
        view.registerCell(cellType: CathegoryCollectionViewCell.self)
        view.backgroundColor = .white
        view.bounces = false
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = false
        view.isScrollEnabled = false
        return view
    }()
    
    public weak var delegate: WCCathegoryListViewDelegate?
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        applyViewCode()
    }
    
    override func customConfigs() {
        defaultBackgroundColor = .clear
    }
                                   
    public func setup(cathegories: [String]) {
        self.cathegories = cathegories
    }
    
    public func setSelectedCells(atPositions indexArray: [Int]) {
        clearCathegories()
        for index in indexArray {
            let cell = collectionView.cellForItem(at: IndexPath(row: index, section: 0), type: CathegoryCollectionViewCell.self)
            cell.state = .enable
        }
    }
    
    public func swapState(atPosition position: Int) {
        let cell = collectionView.cellForItem(at: IndexPath(row: position, section: 0), type: CathegoryCollectionViewCell.self)
        let state = cell.state
        switch state {
        case .enable:
            cell.state = .disable
            break
        case .disable:
            cell.state = .enable
        }
    }
    
    public func setState(atPosition position: Int, enabled: Bool) {
        let cell = collectionView.cellForItem(at: IndexPath(row: position, section: 0), type: CathegoryCollectionViewCell.self)
        cell.state = enabled ? .enable : .disable
    }
    
    public func clearCathegories() {
        if let count = cathegories?.count {
            for i in 0..<count {
                let cell = collectionView.cellForItem(at: IndexPath(row: i, section: 0), type: CathegoryCollectionViewCell.self)
                cell.state = .disable
            }
        }
    }
}

extension WCCathegoryListView: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath, type: CathegoryCollectionViewCell.self)
        let state = cell.state
        switch state {
        case .enable:
            cell.state = .disable
            break
        case .disable:
            cell.state = .enable
        }
        delegate?.didSelectCathegory(atIndex: indexPath.row)
    }
}

extension WCCathegoryListView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cathegories?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(indexPath: indexPath, type: CathegoryCollectionViewCell.self)
        guard let cathegory = cathegories?[indexPath.row] else { return UICollectionViewCell() }
        cell.setup(movieStyle: cathegory)
        return cell
    }
    
}

extension WCCathegoryListView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / Constants.cathegoryWidth, height: Constants.cathegoryHeight)
    }
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.minimumLineSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.interItemSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: Constants.horizontalMargin, bottom: 0, right: Constants.horizontalMargin)
    }
}

extension WCCathegoryListView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(Constants.height)
        }
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
