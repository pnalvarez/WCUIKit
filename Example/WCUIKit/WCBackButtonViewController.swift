//
//  WCBackButtonViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 23/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCBackButtonViewController: UIViewController {
    
    private lazy var backButton: WCBackButton = {
        let view = WCBackButton(frame: .zero)
        view.associatedViewController = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCBackButtonViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(backButton)
    }
    
    func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
