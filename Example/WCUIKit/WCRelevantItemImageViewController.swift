//
//  WCRelevantItemImageViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 08/05/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCRelevanteItemImageViewController: UIViewController {
    
    private lazy var testView: WCRelevantItemImageView = {
        let view = WCRelevantItemImageView(frame: .zero)
        view.imageType = .local
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCRelevanteItemImageViewController: WCRelevantItemImageViewDelegate {
    
    func didTapImageView(imageView: WCRelevantItemImageView) {
        print("Tapped")
    }
}

extension WCRelevanteItemImageViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testView)
    }
    
    func setupConstraints() {
        testView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(60)
        }
    }
    
    func configureViews() {
        testView.setupImage("tipografia-projeto 2")
    }
}
