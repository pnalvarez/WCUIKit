//
//  SearchDisplayView.swift
//  WeCam
//
//  Created by Pedro Alvarez on 14/03/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

public class SearchDisplayView: UIView {
    
    private lazy var photoImageView: WCListItemImageView = {
        let view = WCListItemImageView(frame: .zero)
        return view
    }()
    
    private lazy var nameLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .black
        view.numberOfLines = 0
        view.textAlignment = .left
        view.font = ThemeFonts.RobotoBold(12).rawValue
        return view
    }()
    
    private lazy var secondaryInfoLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .black
        view.numberOfLines = 0
        view.textAlignment = .left
        view.font = ThemeFonts.RobotoRegular(12).rawValue
        return view
    }()
    
    private var name: String?
    private var image: String?
    private var secondaryInfo: String?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(name: String, image: String, secondaryInfo: String) {
        self.name = name
        self.image = image
        self.secondaryInfo = secondaryInfo
        applyViewCode()
    }
}

extension SearchDisplayView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(photoImageView)
        addSubview(nameLbl)
        addSubview(secondaryInfoLbl)
    }
    
    public func setupConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.left.equalToSuperview().inset(37)
            make.width.equalTo(56)
        }
        nameLbl.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-15)
            make.left.equalTo(photoImageView.snp.right).offset(12)
            make.right.equalToSuperview()
        }
        secondaryInfoLbl.snp.makeConstraints { make in
            make.top.equalTo(nameLbl.snp.bottom)
            make.left.equalTo(nameLbl)
            make.right.equalToSuperview()
        }
    }
    
    public func configureViews() {
        backgroundColor = ThemeColors.backgroundGray.rawValue
        photoImageView.setImage(withURL: image ?? "")
        nameLbl.text = name
        secondaryInfoLbl.text = secondaryInfo
    }
}
