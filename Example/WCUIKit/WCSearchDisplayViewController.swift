//
//  WCSearchDisplayViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 23/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCSearchDisplayViewController: UIViewController {
    
    private lazy var testView: WCSearchDisplayView = {
        let view = WCSearchDisplayView(frame: .zero)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testView.setup(name: "Name", imageURL: "logo-apenas", secondaryInfo: "Secondary Info")
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCSearchDisplayViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testView)
    }
    
    func setupConstraints() {
        testView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(24)
        }
    }
}
