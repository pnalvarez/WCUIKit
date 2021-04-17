//
//  BaseSection.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 19/09/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public class BaseSection: TableViewSectionProtocol {
    
    public var builders: [TableViewCellBuilderProtocol] {
        didSet {
            registerCells(in: tableView)
        }
    }
    
    private var tableView: UITableView
    
    public init(builders: [TableViewCellBuilderProtocol] = [],
         tableView: UITableView) {
        self.builders = builders
        self.tableView = tableView
        registerCells(in: tableView)
    }
    
    private func registerCells(in tableView: UITableView) {
        for builder in builders {
            builder.registerCell(in: tableView)
        }
    }
    
    public func heightForHeader() -> CGFloat {
        return 0
    }
    
    public func headerView() -> UIView? {
        return nil
    }
    
    public func numberOfRows() -> Int {
        return builders.count
    }
    
    public func cellHeightFor(indexPath: IndexPath) -> CGFloat {
        return builders[indexPath.row].cellHeight()
    }
    
    public func cellAt(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        return builders[indexPath.row].cellAt(indexPath: indexPath, tableView: tableView)
    }
}
