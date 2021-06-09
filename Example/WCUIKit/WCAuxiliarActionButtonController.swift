//
//  WCAuxiliarActionButtonController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 08/06/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WCUIKit

final class WCAuxiliarActionButtonController: UIViewController {
    
    private lazy var testView: WCAuxiliarActionButton = {
        let view = WCAuxiliarActionButton(frame: .zero)
        view.text = "Concluído"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyViewCode()
    }
}

extension WCAuxiliarActionButtonController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testView)
    }
    
    func setupConstraints() {
        testView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.right.equalToSuperview().inset(32)
            make.width.equalTo(82)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .white
    }
}
