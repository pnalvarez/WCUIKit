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
        let cathegoryView = CathegoryListView(frame: .zero)
        cathegoryView.setup(viewModel: [CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "Romance", isOn: false)])
        view.addSubview(cathegoryView)
        cathegoryView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }
        cathegoryView.setup(viewModel: [CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "", isOn: true),CathegoryListView.CathegoryViewModel(text: "Romance", isOn: false)])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

