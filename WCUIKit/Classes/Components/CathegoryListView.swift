//
//  CathegoryListView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 14/04/21.
//

import UIKit

public protocol CathegoryListViewDelegate: class {
    func didSelectCathegory(atIndex index: Int)
}

public class CathegoryListView: UIView {
    
    public struct CathegoryViewModel {
        let text: String
        let isOn: Bool
        
        public init(text: String, isOn: Bool) {
            self.text = text
            self.isOn = isOn
        }
    }
    
    private enum Constants {
        static let height: CGFloat = 479
    }
    
    private var viewModel: [CathegoryViewModel]? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
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
    
    public weak var delegate: CathegoryListViewDelegate?
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        applyViewCode()
    }
    
    public func setup(viewModel: [CathegoryViewModel]) {
        self.viewModel = viewModel
    }
}

extension CathegoryListView: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCathegory(atIndex: indexPath.row)
    }
}

extension CathegoryListView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(indexPath: indexPath, type: CathegoryCollectionViewCell.self)
        guard let cathegory = viewModel?[indexPath.row] else { return UICollectionViewCell() }
        cell.setup(movieStyle: cathegory.text)
        cell.state = cathegory.isOn ? .enable : .disable
        return cell
    }
    
}

extension CathegoryListView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 3.7, height: 87)
    }
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 26, bottom: 0, right: 26)
    }
}

extension CathegoryListView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(479)
        }
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
