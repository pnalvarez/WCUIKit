//
//  WCDataInputTextFieldView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 07/08/21.
//

import UIKit

@objc
public protocol WCDataInputTextFieldViewDelegate: AnyObject {
    func inputTextFieldShouldReturn(_ textField: WCDataInputTextFieldView) -> Bool
    @objc optional func valueDidChange(_ textField: WCDataInputTextFieldView, text: String)
}

public class WCDataInputTextFieldView: WCUIView {
    
    public enum State {
        case normal
        case error
        
        var color: CGColor {
            switch self {
            case .normal:
                return ThemeColors.borderGray.rawValue.cgColor
            case .error:
                return ThemeColors.alertRed.rawValue.cgColor
            }
        }
    }
    
    public enum TextType {
        case textField
        case textView(layout: TextViewLayout)
    }
    
    public enum TextViewLayout {
        case medium
        case big
        
        var height: CGFloat {
            switch self {
            case .medium:
                return Constants.mediumHeight
            case .big:
                return Constants.bigHeight
            }
        }
    }
    
    private enum Constants {
        static let mediumHeight: CGFloat = 80
        static let bigHeight: CGFloat = 117
        static let spacing: CGFloat = 4
        static let textFieldBorderWidth: CGFloat = 1
        static let textFieldRadius: CGFloat = 4
        static let textFieldHeight: CGFloat = 30
    }
    
    public var textViewState: State = .normal {
        didSet {
            mainComponent?.layer.borderColor = textViewState.color
        }
    }
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.spacing = Constants.spacing
        return view
    }()
    
    private lazy var placeholderLbl: WCUILabelRobotoRegular16Gray = {
        let view = WCUILabelRobotoRegular16Gray(frame: .zero)
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var textField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = ThemeColors.whiteThemeColor.rawValue
        view.font = ThemeFonts.RobotoRegular(12).rawValue
        view.textColor = .black
        view.layer.borderColor = ThemeColors.borderGray.rawValue.cgColor
        view.layer.borderWidth = Constants.textFieldBorderWidth
        view.layer.cornerRadius = Constants.textFieldRadius
        view.textAlignment = .left
        return view
    }()
    
    private lazy var textView: UITextView = {
        let view = UITextView(frame: .zero)
        view.backgroundColor = ThemeColors.whiteThemeColor.rawValue
        view.textColor = .black
        view.font = ThemeFonts.RobotoRegular(12).rawValue
        view.layer.borderColor = ThemeColors.borderGray.rawValue.cgColor
        view.layer.borderWidth = Constants.textFieldBorderWidth
        view.layer.cornerRadius = Constants.textFieldRadius
        view.textAlignment = .left
        return view
    }()
    
    private let textFieldType: TextType
    
    private var mainComponent: UIView?
    private var layout: TextViewLayout?
    
    public var text: String? {
        return getMainComponentText()
    }
    
    public var delegate: WCDataInputTextFieldViewDelegate?
    
    public init(frame: CGRect,
                textFieldType: TextType) {
        self.textFieldType = textFieldType
        super.init(frame: frame)
        configureMainComponent()
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(placeholder: String) {
        self.placeholderLbl.text = placeholder
    }
    
    private func configureMainComponent() {
        switch textFieldType {
        case .textField:
            mainComponent = textField
        case .textView(let layout):
            mainComponent = textView
            self.layout = layout
        }
    }
    
    private func getMainComponentText() -> String? {
        if mainComponent == textField {
            return textField.text
        } else {
            return textView.text
        }
    }
}

extension WCDataInputTextFieldView: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.inputTextFieldShouldReturn(self) ?? true
    }
}

extension WCDataInputTextFieldView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        mainStackView.addArrangedSubview(placeholderLbl)
        mainStackView.addArrangedSubview(mainComponent ?? textField)
        addSubview(mainStackView)
    }
    
    public func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        if mainComponent == textView {
            mainComponent?.snp.makeConstraints { make in
                make.height.equalTo(layout?.height ?? 0)
            }
        } else if mainComponent == textField {
            mainComponent?.snp.makeConstraints { make in
                make.height.equalTo(Constants.textFieldHeight)
            }
        }
    }
}
