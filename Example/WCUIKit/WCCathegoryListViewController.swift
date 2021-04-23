//
//  WCCathegoryListViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 21/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCCathegoryListViewController: UIViewController {
    
    private lazy var cathegoryListView: WCCathegoryListView = {
        let view = WCCathegoryListView(frame: .zero)
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        cathegoryListView.setup(cathegories: ["Ação", "Aventura", "Ação", "Dança"])
        applyViewCode()
    }
}

extension WCCathegoryListViewController: WCCathegoryListViewDelegate {
    
    func didSelectCathegory(atIndex index: Int) {
        
    }
}

extension WCCathegoryListViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(cathegoryListView)
    }
    
    func setupConstraints() {
        cathegoryListView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.right.equalToSuperview()
        }
    }
}
