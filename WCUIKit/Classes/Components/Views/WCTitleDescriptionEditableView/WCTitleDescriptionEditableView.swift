//
//  WCTitleDescriptionEditableView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 08/05/21.
//

import UIKit

@objc
public protocol WCTitleDescriptionEditableViewDelegate: AnyObject {
    func didTapSave(title: String, description: String, titleDescriptionView: WCTitleDescriptionEditableView)
    @objc optional func didTapCancel(titleDescriptionView: WCTitleDescriptionEditableView)
}

public class WCTitleDescriptionEditableView: WCUIView {
    
    public enum State {
        case `default`
        case editing
        case disabled
        
        var auxiliarButtonText: String {
            switch self {
            case .default:
                return "Editar"
            case .editing:
                return "Salvar"
            case .disabled:
                return ""
            }
        }
        
        var closeButtonIsHidden: Bool {
            return self != .editing
        }
        
        var editButtonIsHidden: Bool {
            return self == .disabled
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
        view.delegate = self
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
    
    private lazy var editButton: WCSmallAuxiliarButton = {
        let view = WCSmallAuxiliarButton(frame: .zero)
        view.addTarget(self, action: #selector(didTapEditButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var closeButton: WCCloseButton = {
        let view = WCCloseButton(frame: .zero, layout: .small)
        view.context = .component(callback: {
            self.state = .default
        })
        return view
    }()
    
    public var state: State = .default {
        didSet {
            updateStateUI()
        }
    }
    
    private var title: String?
    private var descriptionText: String?
    public weak var delegate: WCTitleDescriptionEditableViewDelegate?
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateStateUI()
    }
    
    public func setup(title: String, description: String) {
        self.title = title
        self.descriptionText = description
        applyViewCode()
    }
    
    private func updateStateUI() {
        editButton.text = state.auxiliarButtonText
        editButton.isHidden = state.editButtonIsHidden
        closeButton.isHidden = state.closeButtonIsHidden
        titleTextField.isUserInteractionEnabled = state.interactionEnabled
        sinopsisTextView.isUserInteractionEnabled = state.interactionEnabled
    }
    
    @objc
    private func didTapEditButton() {
        if state == .default {
            state = .editing
        } else if state == .editing {
            delegate?.didTapSave(title: titleTextField.text ?? "", description: sinopsisTextView.text ?? "",titleDescriptionView: self)
        }
    }
}

extension WCTitleDescriptionEditableView: UITextViewDelegate {
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // Combine the new text with the old
        let combinedText = (textView.text as NSString).replacingCharacters(in: range, with: text)

        // Create a duplicate of the text view with the same frame and font
        let duplicateTextView = UITextView(frame: textView.frame)
        duplicateTextView.font = textView.font

        // Set the text view to contain the tentative new version of the text
        duplicateTextView.text = combinedText

        // Use sizeToFit in order to make the text view's height fit the text exactly
        duplicateTextView.sizeToFit()

        // Then use the duplicate text view's height for the comparison
        if(duplicateTextView.frame.size.height <= textView.frame.height){
            return true
        }
        else {
            return false
        }
    }
}

extension WCTitleDescriptionEditableView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        containerView.addSubview(titleTextField)
        containerView.addSubview(sinopsisTextView)
        buttonStackView.addArrangedSubview(editButton)
        buttonStackView.addArrangedSubview(closeButton)
        containerView.addSubview(buttonStackView)
        addSubview(containerView)
    }
    
    public func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.left.right.equalToSuperview()
            make.height.equalTo(19)
        }
        sinopsisTextView.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(26)
        }
        buttonStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(4)
            make.right.equalToSuperview().inset(4)
        }
        editButton.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
    }
    
    public func configureViews() {
        titleTextField.text = title
        sinopsisTextView.text = descriptionText
    }
}
