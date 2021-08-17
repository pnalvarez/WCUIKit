//
//  WCInputTextFieldController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 16/08/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WCUIKit
import UIKit

final class WCInputTextFieldController: UIViewController {
    
    private lazy var textField: WCInputTextField = {
        let view = WCInputTextField(frame: .zero)
        view.placeholder = "E-mail"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCInputTextFieldController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(textField)
    }
    
    func setupConstraints() {
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(40)
        }
    }
}
