//
//  WCToastViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 21/06/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WCUIKit

final class WCToastViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        WCToastView().show(withTitle: "Toast de Sucesso", status: .error, in: view)
    }
}
