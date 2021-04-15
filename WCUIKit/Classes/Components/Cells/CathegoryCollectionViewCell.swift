//
//  CathegoryCollectionViewCell.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 19/08/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

public class CathegoryCollectionViewCell: UICollectionViewCell {
    
    public enum State {
        case enable
        case disable
    }
    
    private lazy var mainLbl: UILabel = { return UILabel(frame: .zero) }()
    
    private var movieStyle: String?
    
    public var state: State = .disable {
        didSet {
            switch state {
            case .enable:
                enableButton()
                break
            case .disable:
                disableButton()
            }
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 4
        backgroundColor = ThemeColors.emptyRedColor.rawValue.withAlphaComponent(0.6)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(movieStyle: String) {
        self.movieStyle = movieStyle
        applyViewCode()
    }
}

extension CathegoryCollectionViewCell {
    
    private func enableButton() {
        backgroundColor = ThemeColors.mainRedColor.rawValue
    }
    
    private func disableButton() {
        backgroundColor = ThemeColors.emptyRedColor.rawValue.withAlphaComponent(0.6)
    }
}

extension CathegoryCollectionViewCell: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(mainLbl)
    }
    
    public func setupConstraints() {
        mainLbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(5)
        }
    }
    
    public func configureViews() {
        mainLbl.text = movieStyle
        mainLbl.textAlignment = .center
        mainLbl.numberOfLines = 0
        mainLbl.font = ThemeFonts.RobotoBold(12).rawValue
        mainLbl.textColor = .white
        mainLbl.adjustsFontSizeToFitWidth = true
    }
}
