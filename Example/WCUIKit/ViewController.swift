//
//  ViewController.swift
//  WCUIKit
//
//  Created by pnalvarez on 04/11/2021.
//  Copyright (c) 2021 pnalvarez. All rights reserved.
//

import UIKit
import WCUIKit

class ViewController: UIViewController {
    
    let cathegoryView = WCCathegoryListView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        cathegoryView.delegate = self
        cathegoryView.setup(cathegories: ["Romance", "Ação", "Romance", "Ação", "Romance", "Ação", "Romance", "Ação", "Romance", "Ação"])
        view.addSubview(cathegoryView)
        cathegoryView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: WCCathegoryListViewDelegate {
    
    func didSelectCathegory(atIndex index: Int) {
    
    }
}

