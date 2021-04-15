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

    override func viewDidLoad() {
        super.viewDidLoad()
        let headerView = WCHeaderView(frame: .zero)
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(48)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

