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
        let view = WCDataInputTextFieldView(frame: .zero, textFieldType: .textView(layout: .medium))
        view.setup(placeholder: "TextView")
        return view
    }()
    
    private lazy var stackView: UIStackView = {
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
        stackView.addArrangedSubview(textFieldView)
        stackView.addArrangedSubview(textView)
        view.addSubview(stackView)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(32)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .white
    }
}

