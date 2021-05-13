//
//  WCOptionsToolbarController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 12/05/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCOptionsToolbarController: UIViewController {
    
    private lazy var testView: WCOptionsToolbar = {
        let view = WCOptionsToolbar(frame: .zero)
        view.setupToolbarLayout(optionNames: ["Usuários", "Projetos em andamento", "Projetos finalizados"])
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCOptionsToolbarController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testView)
    }
    
    func setupConstraints() {
        testView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(42)
        }
    }
}
