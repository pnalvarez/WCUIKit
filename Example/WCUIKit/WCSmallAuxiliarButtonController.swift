//
//  WCSmallAuxiliarButtonController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 08/05/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCSmallAuxiliarButtonController: UIViewController {
    
    private lazy var testButton: WCSmallAuxiliarButton = {
        let view = WCSmallAuxiliarButton(frame: .zero)
        view.text = "Editar"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCSmallAuxiliarButtonController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testButton)
    }
    
    func setupConstraints() {
        testButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(38)
        }
    }
}
