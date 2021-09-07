//
//  WCEditProgressViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 11/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WCUIKit

final class WCEditProgressViewController: UIViewController {
    
    private lazy var testView: WCEditProgressView = {
        let view = WCEditProgressView(frame: .zero)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        testView.show(in: self,
                      text: "Como está o seu projeto?",
                      progress: 1.0,
                      doneAction: {
                        print("Done \(self.testView.progress)")
                      }, cancelAction: {
                        print("Cancel")
                      })
    }
}

