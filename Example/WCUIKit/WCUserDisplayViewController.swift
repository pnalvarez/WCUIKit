//
//  WCUserDisplayViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 23/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCUserDisplayViewController: UIViewController {
    
    private lazy var testView: WCUserDisplayView = {
        let view = WCUserDisplayView(frame: .zero, name: "Name", ocupation: "Ocupation", photo: "photo", layout: .large)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCUserDisplayViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testView)
    }
    
    func setupConstraints() {
        testView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(274)
        }
    }
}
