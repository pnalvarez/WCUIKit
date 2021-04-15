//
//  TableViewSectionProtocol.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 19/09/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

public protocol TableViewSectionProtocol {
    var builders: [TableViewCellBuilderProtocol] { get set }
    
    func numberOfRows() -> Int
    func heightForHeader() -> CGFloat
    func headerView() -> UIView?
    func cellHeightFor(indexPath: IndexPath) -> CGFloat
    func cellAt(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
}
