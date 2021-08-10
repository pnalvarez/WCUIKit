//
//  WCDataTextFieldViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 08/08/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WCUIKit

final class WCDataTextFieldViewController: UIViewController {
    
    private lazy var textFieldView: WCDataInputTextFieldView = {
        let view = WCDataInputTextFieldView(frame: .zero, textFieldType: .textField)
        view.setup(placeholder: "TextField")
        return view
    }()
    
    private lazy var textView: WCDataInputTextFieldView = {
        let view = WCDataInputTextFieldView(frame: .zero, textFieldType: .textView(layout: .big))
        view.setup(placeholder: "TextView")
        return view
    }()
    
    private lazy var needTextField: WCDataInputTextFieldView = {
        let view = WCDataInputTextFieldView(frame: .zero, textFieldType: .textView(layout: .medium))
        view.setup(placeholder: "Need")
        return view
    }()
    
    private lazy var label: WCUILabelRobotoRegular16 = {
        let view = WCUILabelRobotoRegular16(frame: .zero)
        view.text = "Equipe"
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.alwaysBounceHorizontal = true
        view.bounces = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var actionButton: WCPrimaryActionButton = {
        let view = WCPrimaryActionButton(frame: .zero)
        view.text = "Action"
        return view
    }()
    
    private lazy var inviteFriendsButton: WCSecondaryButton = {
        let view = WCSecondaryButton(frame: .zero)
        view.text = "Convidar amigos"
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.spacing = 24
        view.axis = .vertical
        return view
    }()
    
    private lazy var inputStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.spacing = 12
        view.axis = .vertical
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyViewCode()
    }
}

extension WCDataTextFieldViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        inputStackView.addArrangedSubviews(textFieldView, textView, needTextField)
        view.addSubview(inputStackView)
        buttonStackView.addArrangedSubviews(label, collectionView, inviteFriendsButton, actionButton)
        view.addSubview(buttonStackView)
    }
    
    func setupConstraints() {
        inputStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.left.right.equalToSuperview().inset(32)
        }
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(inputStackView.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(72)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .white
    }
}

