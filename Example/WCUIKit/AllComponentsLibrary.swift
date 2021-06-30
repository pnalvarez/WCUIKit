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
    case wcsegmentedControl
    case internetErrorConnectionView
    case loadingView
    case relevantImageView
    case smallAuxiliarButton
    case titleDescriptionEditable
    case bulletEditableItem
    case optionsToolbar
    case profileHeader
    case auxiliarActionButton
    case dialogView
    case toastView
    case scrollView
    
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
        case .wcsegmentedControl:
            return "WCSegmentedControl"
        case .internetErrorConnectionView:
            return "Internet Error Connection View"
        case .loadingView:
            return "Loading View"
        case .relevantImageView:
            return "Relevante Image View"
        case .smallAuxiliarButton:
            return "Small Auxiliar Button"
        case .titleDescriptionEditable:
            return "WCTitleDescriptionEditableText"
        case .bulletEditableItem:
            return "Bullet Editable Item"
        case .optionsToolbar:
            return "Options Toolbar"
        case .profileHeader:
            return "Profile Header"
        case .auxiliarActionButton:
            return "Auxiliar Action Button"
        case .dialogView:
            return "Dialog View"
        case .toastView:
            return "Toast View"
        case .scrollView:
            return "ScrollView"
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
        case .wcsegmentedControl:
            return WCSegmentedControlController()
        case .internetErrorConnectionView:
            return WCInternetErrorConnectionController()
        case .loadingView:
            return WCLoadingViewController()
        case .relevantImageView:
            return WCRelevanteItemImageViewController()
        case .smallAuxiliarButton:
            return WCSmallAuxiliarButtonController()
        case .titleDescriptionEditable:
            return WCTitleDescriptionEditableViewController()
        case .bulletEditableItem:
            return WCBulletEditableItemViewController()
        case .optionsToolbar:
            return WCOptionsToolbarController()
        case .profileHeader:
            return WCProfileHeaderViewController()
        case .auxiliarActionButton:
            return WCAuxiliarActionButtonController()
        case .dialogView:
            return WCDialogViewController()
        case .toastView:
            return WCToastViewController()
        case .scrollView:
            return WCUIScrollViewController()
        }
    }
}
