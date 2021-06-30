//
//  WCUIScrollViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 29/06/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WCUIKit

final class WCUIScrollViewController: UIViewController {
    
    private lazy var testScrollView: WCUIScrollView = {
        let view = WCUIScrollView(frame: .zero)
        view.colorStyle = .white
        return view
    }()
    
    private lazy var testView1: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var testView2: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var testView3: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var testView4: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCUIScrollViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testScrollView)
        testScrollView.addSubview(testView1)
        testScrollView.addSubview(testView2)
        testScrollView.addSubview(testView3)
        testScrollView.addSubview(testView4)
    }
    
    func setupConstraints() {
        testScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        testView1.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(100)
        }
        testView2.snp.makeConstraints { make in
            make.top.equalTo(testView1.snp.bottom).offset(220)
            make.right.left.equalToSuperview()
            make.height.equalTo(100)
        }
        testView3.snp.makeConstraints { make in
            make.top.equalTo(testView2.snp.bottom).offset(220)
            make.right.left.equalToSuperview()
            make.height.equalTo(100)
        }
        testView4.snp.makeConstraints { make in
            make.top.equalTo(testView3.snp.bottom).offset(220)
            make.bottom.right.left.equalToSuperview()
            make.height.equalTo(100)
        }
    }
}
