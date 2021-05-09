//
//  WCBulletEditableItemViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 09/05/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCBulletEditableItemViewController: UIViewController {
    
    private lazy var testView: WCBulletEditableItemView = {
        let view = WCBulletEditableItemView(frame: .zero)
        view.state = .default
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        testView.setup(headerText: "Precisam de:", needingText: "Artistas")
        applyViewCode()
    }
}

extension WCBulletEditableItemViewController: WCBulletEditableItemViewDelegate {
    
    func didTapSave(text: String, bulletEditableView: WCBulletEditableItemView) {
        
    }
}


extension WCBulletEditableItemViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testView)
    }
    
    func setupConstraints() {
        testView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(60)
        }
    }
}
