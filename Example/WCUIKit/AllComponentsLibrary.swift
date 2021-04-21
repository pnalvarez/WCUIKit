//
//  AllComponentsLibrary.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 21/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

enum AllComponentsLibrary {
    case actionButton
    case cathegoryListView
    case progressView
    
    var text: String {
        switch self {
        case .actionButton:
            return "Action Button"
        case .cathegoryListView:
            return "Cathegory List"
        case .progressView:
            return "Progress View"
        }
    }
    
    var controller: UIViewController {
        switch self {
        case .actionButton:
            return WCActionButtonViewController()
        case .cathegoryListView:
            return WCCathegoryListViewController()
        case .progressView:
            return WCProgressViewController()
        }
    }
}
