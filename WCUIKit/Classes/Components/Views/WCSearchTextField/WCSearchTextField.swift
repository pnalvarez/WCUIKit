//
//  DefaultSearchTextField.swift
//  WeCam
//
//  Created by Pedro Alvarez on 06/03/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

public protocol WCSearchTextFieldDelegate: AnyObject {
    func didTapSearch(searchTextField: WCSearchTextField)
}

public class WCSearchTextField: UITextField {
    
    private enum Constants {
        static let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 20)
    }
    
    private lazy var dividerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ThemeColors.dividerGray.rawValue
        return view
    }()
    
    private lazy var searchButton: WCSearchButton = {
        let view = WCSearchButton(frame: .zero)
        view.addTarget(self, action: #selector(didTapSearch), for: .touchUpInside)
        return view
    }()
    
    public weak var searchDelegate: WCSearchTextFieldDelegate?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = ThemeColors.hexe3e0e0.rawValue.cgColor
        font = ThemeFonts.RobotoRegular(14).rawValue
        textColor = .black
        textAlignment = .left
        autocapitalizationType = .none
        autocorrectionType = .no
        tintColor = ThemeColors.mainRedColor.rawValue
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Constants.padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Constants.padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Constants.padding)
    }
    
    @objc
    private func didTapSearch() {
        searchDelegate?.didTapSearch(searchTextField: self)
    }
}

extension WCSearchTextField: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(dividerView)
        addSubview(searchButton)
    }
    
    public func setupConstraints() {
        dividerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalTo(searchButton.snp.left)
            make.width.equalTo(1)
        }
        searchButton.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(20)
        }
    }
}
