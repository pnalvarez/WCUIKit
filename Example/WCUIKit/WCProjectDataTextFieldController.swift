//
//  WCProjectDataTextFieldController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 23/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCProjectDataTextFieldController: UIViewController {
    
    private lazy var textField: WCDataTextField = {
        let view = WCDataTextField(frame: .zero)
        view.textFieldState = .normal
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCProjectDataTextFieldController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(textField)
    }
    
    func setupConstraints() {
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(24)
        }
    }
}
