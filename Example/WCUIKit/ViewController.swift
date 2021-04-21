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
    
    @IBOutlet weak var tableView: UITableView!
    let cathegoryView = WCCathegoryListView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        cathegoryView.delegate = self
        cathegoryView.setup(cathegories: ["Romance", "Ação", "Romance", "Ação", "Romance", "Ação", "Romance", "Ação", "Romance", "Ação"])
        view.addSubview(cathegoryView)
        cathegoryView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cathegoryView.setSelectedCells(atPositions: [0,1,2])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension ViewController: WCCathegoryListViewDelegate {
    
    func didSelectCathegory(atIndex index: Int) {
    
    }
}

