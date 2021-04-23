//
//  WCProgressViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 21/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCProgressViewController: UIViewController {
    
    private lazy var progressView: WCProgressView = {
        let view = WCProgressView(frame: .zero)
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCProgressViewController: WCProgressViewDelegate {
    
    func didChangeValue(_ progressView: WCProgressView, percentage: Float) {
        
    }
}

extension WCProgressViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(progressView)
    }
    
    func setupConstraints() {
        progressView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(96)
        }
    }
}
