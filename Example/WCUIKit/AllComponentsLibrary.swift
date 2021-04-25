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
    case searchDisplayView
    case userDisplayView
    case backButton
    case secondaryButton
    
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
        case .searchDisplayView:
            return "Search Display View"
        case .userDisplayView:
            return "User Display View Controller"
        case .backButton:
            return "Back Button"
        case .secondaryButton:
            return "Secondary Button"
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
        case .searchDisplayView:
            return WCSearchDisplayViewController()
        case .userDisplayView:
            return WCUserDisplayViewController()
        case .backButton:
            return WCBackButtonViewController()
        case .secondaryButton:
            return WCSecondaryButtonController()
        }
    }
}
