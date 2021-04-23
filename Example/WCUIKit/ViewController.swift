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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllComponentsLibrary.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.text = AllComponentsLibrary.allCases[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = AllComponentsLibrary.allCases[indexPath.row].controller
        navigationController?.pushViewController(viewController, animated: true)
    }
}


