//
//  TableViewFactory.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 19/09/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public protocol TableViewFactory {
    func buildSections() -> [TableViewSectionProtocol]
}
