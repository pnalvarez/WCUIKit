//
//  WCImageButtonController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 28/08/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WCUIKit
import UIKit

final class WCImageButtonController: UIViewController {
    
    private lazy var testView: WCImageButton = {
        let view = WCImageButton(frame: .zero)
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCImageButtonController: WCImageButtonDelegate {
    
    func didChangeButtonImage(_ view: WCImageButton) {
        print("Did tap")
    }
}

extension WCImageButtonController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testView)
    }
    
    func setupConstraints() {
        testView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(84)
        }
    }
}
