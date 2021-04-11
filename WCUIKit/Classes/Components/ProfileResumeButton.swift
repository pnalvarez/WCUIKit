//
//  ProfileResumeButton.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 07/10/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public class ProfileResumeButton: UIButton {
    
    private lazy var photoImageView: WCListItemImageView = {
        let view = WCListItemImageView(frame: .zero)
        return view
    }()
    
    private lazy var nameLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .black
        view.font = ThemeFonts.RobotoBold(10).rawValue
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var ocupationLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .black
        view.font = ThemeFonts.RobotoRegular(10).rawValue
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    private let image: String?
    private let name: String?
    private let ocupation: String?
    
    public init(frame: CGRect,
         image: String,
         name: String,
         ocupation: String) {
        self.image = image
        self.name = name
        self.ocupation = ocupation
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileResumeButton: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(photoImageView)
        addSubview(nameLbl)
        addSubview(ocupationLbl)
    }
    
    public func setupConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(30)
            make.left.equalToSuperview().inset(6)
        }
        nameLbl.snp.makeConstraints { make in
            make.top.equalTo(photoImageView)
            make.width.equalTo(86)
            make.left.equalTo(photoImageView.snp.right).offset(4)
        }
        ocupationLbl.snp.makeConstraints { make in
            make.top.equalTo(nameLbl.snp.bottom)
            make.left.width.equalTo(nameLbl)
        }
    }
    
    public func configureViews() {
        backgroundColor = ThemeColors.backgroundGray.rawValue.withAlphaComponent(0.6)
        layer.cornerRadius = 2
        layer.borderWidth = 1
        layer.borderColor = ThemeColors.e5dfdf.rawValue.cgColor
        clipsToBounds = true
        
        photoImageView.setImage(withURL: image ?? "")
        nameLbl.text = name
        ocupationLbl.text = ocupation
    }
}
