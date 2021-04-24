//
//  AllComponentsLibrary.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 21/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

enum AllComponentsLibrary: CaseIterable {
    case actionButton
    case cathegoryListView
    case progressView
    case projectDataTextField
    case projectDataTextView
    
    var text: String {
        switch self {
        case .actionButton:
            return "Action Button"
        case .cathegoryListView:
            return "Cathegory List"
        case .progressView:
            return "Progress View"
        case .projectDataTextField:
            return "Project Data Text Field"
        case .projectDataTextView:
            return "Project Data Text View"
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
        case .projectDataTextField:
            return WCProjectDataTextFieldController()
        case .projectDataTextView:
            return WCProjectDataTextViewController()
        }
    }
}
