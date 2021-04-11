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
        let label = UILabel(frame: .zero)
        label.font = ThemeFonts.RobotoBold(20).rawValue
        label.text = "Text"
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

