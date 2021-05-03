//
//  WCLoadingViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 02/05/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCLoadingViewController: UIViewController {
    
    private lazy var testView: WCLoadingView = {
        let view = WCLoadingView(frame: .zero)
        view.animateRotate()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyViewCode()
    }
}

extension WCLoadingViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testView)
    }
    
    func setupConstraints() {
        testView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
