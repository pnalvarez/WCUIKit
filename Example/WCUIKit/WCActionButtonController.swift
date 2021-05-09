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
    
    private lazy var smallActionButton: WCActionButton = {
        let view = WCActionButton(frame: .zero)
        view.layout = .small
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
        view.addSubview(smallActionButton)
    }
    
    func setupConstraints() {
        actionButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(100)
        }
        smallActionButton.snp.makeConstraints { make in
            make.top.equalTo(actionButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
        }
    }
}
