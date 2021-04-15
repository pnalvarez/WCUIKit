//
//  TableViewCellBuilderProtocol.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 19/09/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

public protocol TableViewCellBuilderProtocol {
    func registerCell(in tableView: UITableView)
    func cellHeight() -> CGFloat
    func cellAt(indexPath: IndexPath,
                tableView: UITableView) -> UITableViewCell
}
