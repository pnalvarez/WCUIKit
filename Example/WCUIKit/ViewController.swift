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
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar(frame: .zero)
        view.barTintColor = ThemeColors.mainRedColor.rawValue
        view.backgroundColor = .white
        view.delegate = self
        view.sizeToFit()
        return view
    }()
    
    private lazy var searchButton: UIBarButtonItem = {
        let view = UIBarButtonItem(barButtonSystemItem: .search,
                                   target: self,
                                   action: #selector(didTapSearch))
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = ThemeColors.mainRedColor.rawValue
        navigationController?.navigationBar.backgroundColor = ThemeColors.mainRedColor.rawValue
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = searchButton
        title = "WCUIKit Components"
    }
    
    @objc
    private func didTapSearch() {
        navigationItem.titleView = searchBar
        searchBar.showsCancelButton = true
        navigationItem.rightBarButtonItem = nil
        searchBar.becomeFirstResponder()
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.titleView = nil
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


