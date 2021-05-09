//
//  WCTitleDescriptionEditableView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 08/05/21.
//

import UIKit

public protocol WCTitleDescriptionEditableViewDelegate: AnyObject {
    
}

public class WCTitleDescriptionEditableView: UIView {
    
    public enum State {
        case `default`
        case editing
        
        var auxiliarButtonText: String {
            switch self {
            case .default:
                return "Editar"
            case .editing:
                return "Salvar"
            }
        }
        
        var closeButtonIsHidden: Bool {
            return self == .default
        }
        
        var interactionEnabled: Bool {
            return self == .editing
        }
    }
    
    private enum Constants {
        static let containerCornerRadius: CGFloat = 4
        static let containerBorderWidth: CGFloat = 1
        static let buttonStackSpace: CGFloat = 3
    }
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = Constants.containerCornerRadius
        view.layer.borderWidth = Constants.containerBorderWidth
        view.layer.borderColor = ThemeColors.hexe3e0e0.rawValue.cgColor
        return view
    }()
    
    private lazy var titleTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.textAlignment = .center
        view.textColor = ThemeColors.hex707070.rawValue
        view.font = ThemeFonts.RobotoBold(16).rawValue
        view.layer.borderWidth = 0
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private lazy var sinopsisTextView: UITextView = {
        let view = UITextView(frame: .zero)
        view.textAlignment = .center
        view.textColor = ThemeColors.black.rawValue
        view.font = ThemeFonts.RobotoRegular(12).rawValue
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = true
        view.sizeToFit()
        view.isScrollEnabled = false
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fill
        view.spacing = Constants.buttonStackSpace
        return view
    }()
    
}

extension WCTitleDescriptionEditableView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        
    }
}
