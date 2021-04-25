//
//  UITableView+.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 02/08/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public typealias TableViewProtocol = NSObject & UITableViewDelegate & UITableViewDataSource

public extension UITableView {
    
    func assignProtocols(to output: TableViewProtocol) {
        DispatchQueue.main.async {
            self.delegate = output
            self.dataSource = output
        }
    }
    
    func registerCell<T: UITableViewCell>(cellType: T.Type) {
        DispatchQueue.main.async {
            self.register(cellType, forCellReuseIdentifier: T.defaultReuseIdentifier)
        }
    }
    
    func dequeueReusableCell <T: UITableViewCell>(indexPath: IndexPath, type: T.Type) -> T {
        let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
        return cell
    }
    
    func cellForRow<T: UITableViewCell>(at indexPath: IndexPath, type: T.Type) -> T {
        let cell = cellForRow(at: indexPath) as! T
        return cell
    }
    
    func checkEmptyState(text: String, layout: WCEmptyListView.Layout) {
        if visibleCells.isEmpty {
            backgroundView = WCEmptyListView(frame: .zero,
                                             layout: layout,
                                             text: text)
        } else {
            backgroundView = nil
        }
    }
}
