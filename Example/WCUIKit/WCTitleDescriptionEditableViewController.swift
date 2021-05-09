//
//  WCTitleDescriptionEditableViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 09/05/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCTitleDescriptionEditableViewController: UIViewController {
    
    private lazy var testView: WCTitleDescriptionEditableView = {
        let view = WCTitleDescriptionEditableView(frame: .zero)
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        testView.setup(title: "Título", description: "Descrição")
        applyViewCode()
    }
}

extension WCTitleDescriptionEditableViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testView)
    }
    
    func setupConstraints() {
        testView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(60)
            make.height.equalTo(180)
        }
    }
}

extension WCTitleDescriptionEditableViewController: WCTitleDescriptionEditableViewDelegate {
    
    func didTapSave(titleDescriptionView: WCTitleDescriptionEditableView) {
        testView.state = .default
    }
}
