//
//  WCSegmentedControlController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 25/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCSegmentedControlController: UIViewController {
    
    private lazy var testView: WCSegmentedControl = {
        let view = WCSegmentedControl(frame: .zero)
        view.criterias = ["Convites", "Histórico"]
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCSegmentedControlController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testView)
    }
    
    func setupConstraints() {
        testView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.right.equalToSuperview().inset(10)
        }
    }
}
