//
//  UserDisplayView.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 25/08/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit
import SDWebImage

public class WCUserDisplayView: WCUIView {
    
    public enum LayoutType {
        case small
        case large
        
        public var photoMargin: CGFloat {
            switch self {
            case .small:
                return Constants.photoMarginSmall
            case .large:
                return Constants.photoMarginLarge
            }
        }
        
        public var fontSize: CGFloat {
            switch self {
            case .small:
                return Constants.smallFontSize
            case .large:
                return Constants.largeFontSize
            }
        }
        
        public var spaceBetweenPhotoInfo: CGFloat {
            switch self {
            case .small:
                return Constants.spaceBetweenPhotoInfoSmall
            case .large:
                return Constants.spaceBetweenPhotoInfoLarge
            }
        }
        
        public var photoLeftMargin: CGFloat {
            switch self {
            case .small:
                return Constants.photoLeftMarginSmall
            case .large:
                return Constants.photoLeftMarginLarge
            }
        }
        
        public var infoTopMargin: CGFloat {
            switch self {
            case .small:
                return Constants.infoTopMarginSmall
            case .large:
                return Constants.infoTopMarginLarge
            }
        }
    }
    
    private enum Constants {
        static let largeFontSize: CGFloat = 15
        static let smallFontSize: CGFloat = 10
        static let photoMarginLarge: CGFloat = 9
        static let photoMarginSmall: CGFloat = 5
        static let spaceBetweenPhotoInfoSmall: CGFloat = 2
        static let spaceBetweenPhotoInfoLarge: CGFloat = 12
        static let photoLeftMarginSmall: CGFloat = 1
        static let photoLeftMarginLarge: CGFloat = 15
        static let infoTopMarginSmall: CGFloat = 1
        static let infoTopMarginLarge: CGFloat = 12
    }
    
    private lazy var photoImageView: WCListItemImageView = {
        let view = WCListItemImageView(frame: .zero)
        return view
    }()
    
    private lazy var nameLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .black
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var ocupationLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .black
        view.numberOfLines = 0
        return view
    }()
    
    private var name: String
    private var ocupation: String
    private var photo: String?
    private var layout: LayoutType = .small
    
    private var photoMargin: CGFloat {
        return layout.photoMargin
    }
    
    private var fontSize: CGFloat {
        return layout.fontSize
    }
    
    private var spaceBetweenPhotoInfo: CGFloat {
        return layout.spaceBetweenPhotoInfo
    }
    
    private var photoLeftMargin: CGFloat {
        return layout.photoLeftMargin
    }
    
    private var infoTopMargin: CGFloat {
        return layout.infoTopMargin
    }
    
    public init(frame: CGRect,
         name: String = "",
         ocupation: String = "",
         photo: String? = nil,
         layout: LayoutType = .small) {
        self.name = name
        self.ocupation = ocupation
        self.photo = photo
        self.layout = layout
        super.init(frame: frame)
        applyViewCode()
    }
    
    public func setup(name: String,
               ocupation: String,
               photo: String) {
        self.name = name
        self.ocupation = ocupation
        self.photo = photo
        fillInformation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.layer.cornerRadius = photoImageView.frame.height / 2
    }
    
    private func fillInformation() {
        nameLbl.text = name
        ocupationLbl.text = ocupation
        guard let image = photo else { return }
        photoImageView.sd_setImage(with: URL(string: image), completed: nil)
    }
}

extension WCUserDisplayView: ViewCodeProtocol {
     
    public func buildViewHierarchy() {
        addSubview(photoImageView)
        addSubview(nameLbl)
        addSubview(ocupationLbl)
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(98)
        }
        photoImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(photoMargin)
            make.left.equalToSuperview().inset(photoLeftMargin)
            make.width.equalTo(photoImageView.snp.height)
        }
        nameLbl.snp.makeConstraints { make in
            make.top.equalTo(photoImageView).offset(infoTopMargin)
            make.left.equalTo(photoImageView.snp.right).offset(spaceBetweenPhotoInfo)
            make.right.equalToSuperview()
        }
        ocupationLbl.snp.makeConstraints { make in
            make.top.equalTo(nameLbl.snp.bottom)
            make.left.equalTo(nameLbl)
            make.right.equalToSuperview()
        }
    }
    
    public func configureViews() {
        clipsToBounds = true
        backgroundColor = ThemeColors.backgroundGray.rawValue
        layer.borderWidth = 1
        layer.borderColor = ThemeColors.hexe3e0e0.rawValue.cgColor
        layer.cornerRadius = 4
        nameLbl.text = name
        ocupationLbl.text = ocupation
        nameLbl.font = ThemeFonts.RobotoBold(fontSize).rawValue
        ocupationLbl.font = ThemeFonts.RobotoRegular(fontSize).rawValue
        photoImageView.setImage(withURL: photo ?? "")
    }
}
