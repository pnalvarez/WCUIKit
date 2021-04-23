//
//  WCActionButtonController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 21/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCActionButtonViewController: UIViewController {
    
    private lazy var actionButton: WCActionButton = {
        let view = WCActionButton(frame: .zero)
        view.text = "Lucky Guy"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCActionButtonViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(actionButton)
    }
    
    func setupConstraints() {
        actionButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }
}
