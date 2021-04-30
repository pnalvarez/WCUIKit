//
//  WCInternetErrorConnectionController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 29/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCInternetErrorConnectionController: UIViewController {
    
    private lazy var testView: WCInternetErrorConnectionView = {
        let view = WCInternetErrorConnectionView(frame: .zero)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testView.delegate = self
        applyViewCode()
    }
}

extension WCInternetErrorConnectionController: WCInternetErrorConnectionViewDelegate {
    
    func didTapTryAgain() {
        print("Did tap try again")
    }
}

extension WCInternetErrorConnectionController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testView)
    }
    
    func setupConstraints() {
        testView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
