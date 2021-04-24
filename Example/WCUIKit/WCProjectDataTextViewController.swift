//
//  WCProjectDataTextViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 23/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCProjectDataTextViewController: UIViewController {
    
    private lazy var textView: WCProjectDataTextView = {
        let view = WCProjectDataTextView(frame: .zero)
        view.textViewState = .normal
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCProjectDataTextViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(textView)
    }
    
    func setupConstraints() {
        textView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(24)
        }
    }
}
