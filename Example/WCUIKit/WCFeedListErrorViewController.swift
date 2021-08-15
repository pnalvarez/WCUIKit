//
//  WCFeedListErrorViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 15/08/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WCUIKit

final class WCFeedListErrorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        WCFeedListErrorView().show(in: self,
                                   message: "Ocorreu um erro ao carregar o feed",
                                   action: "Tentar novamente",
                                   mainAction: {
                                    print("Tap")
                                   })
    }
}
