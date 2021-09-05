//
//  ViewController.swift
//  WCUIKit
//
//  Created by pnalvarez on 04/11/2021.
//  Copyright (c) 2021 pnalvarez. All rights reserved.
//

import UIKit
import WCUIKit

class ComponentLibraryController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar(frame: .zero)
        view.tintColor = ThemeColors.mainRedColor.rawValue
        view.backgroundColor = .white
        view.delegate = self
        view.sizeToFit()
        return view
    }()
    
    private lazy var searchButton: UIBarButtonItem = {
        let view = UIBarButtonItem(barButtonSystemItem: .search,
                                   target: self,
                                   action: #selector(didTapSearch))
        view.tintColor = .blue
        return view
    }()
    
    private var components: [AllComponentsLibrary] = AllComponentsLibrary.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func search(shouldShow: Bool) {
        configureSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    private func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = ThemeColors.mainRedColor.rawValue
        navigationController?.navigationBar.tintColor = .white
        search(shouldShow: false)
        navigationItem.title = "WCUIKit Components"
        
    }
    
    private func configureSearchBarButton(shouldShow: Bool) {
        navigationItem.rightBarButtonItem = shouldShow ? searchButton : nil
        searchBar.showsCancelButton = shouldShow
    }
    
    @objc
    private func didTapSearch() {
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
    }
}

extension ComponentLibraryController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        components = AllComponentsLibrary.allCases.filter({ $0.text.hasPrefix(searchBar.text ?? "")})
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
}

extension ComponentLibraryController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return components.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.text = components[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = components[indexPath.row].controller
        navigationController?.pushViewController(viewController, animated: true)
    }
}


