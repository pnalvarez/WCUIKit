//
//  WCOptionsToolbarCollectionViewCell.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 12/05/21.
//

import UIKit

class WCOptionsToolbarCollectionViewCell: UICollectionViewCell {
    
    var title: String = "" {
        didSet {
            titleLbl.text = title
        }
    }
    
    override var isSelected: Bool {
        didSet {
            titleLbl.textColor = isSelected ? ThemeColors.mainRedColor.rawValue : ThemeColors.hex707070.rawValue
            selectionView.backgroundColor = isSelected ? ThemeColors.mainRedColor.rawValue : ThemeColors.whiteThemeColor.rawValue
        }
    }
    
    private lazy var titleLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = ThemeFonts.RobotoBold(15).rawValue
        view.textColor = ThemeColors.hex707070.rawValue
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var selectionView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyViewCode()
    }
    
    public func setup(title: String) {
        self.title = title
        applyViewCode()
    }
}

extension WCOptionsToolbarCollectionViewCell: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        addSubview(titleLbl)
        addSubview(selectionView)
    }
    
    func setupConstraints() {
        titleLbl.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        selectionView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.height.equalTo(4)
        }
    }
}
