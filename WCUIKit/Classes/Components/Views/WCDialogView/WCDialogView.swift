//
//  WCDialogView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 14/06/21.
//

import UIKit

public class WCDialogView: WCUIView {
    
    public enum DialogType {
        case successNotification
        case errorNotification
        case interaction
    }
    
    private enum Constants {
        static let labelSpacing: CGFloat = 12
        static let buttonSpacing: CGFloat = 16
        static let spacingBetweenStacks: CGFloat = 24
        static let radius: CGFloat = 14
        static let buttonWidth: CGFloat = 150
        static let horizontalMargin: CGFloat = 48
        static let borderWidth: CGFloat = 0.5
    }
    
    private lazy var titleLbl: WCUILabelRobotoBold18 = {
        let view = WCUILabelRobotoBold18(frame: .zero)
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var descriptionLbl: WCUILabelRobotoRegular14 = {
        let view = WCUILabelRobotoRegular14(frame: .zero)
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var labelStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.alignment = .center
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = Constants.labelSpacing
        return view
    }()
    
    private lazy var doneButton: WCDialogButton = {
        let view = WCDialogButton(frame: .zero)
        view.addTarget(self, action: #selector(doneCallback), for: .touchUpInside)
        return view
    }()
    
    private lazy var cancelButton: WCAuxiliarActionButton = {
        let view = WCAuxiliarActionButton(frame: .zero)
        view.addTarget(self, action: #selector(cancelCallback), for: .touchUpInside)
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.alignment = .center
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = Constants.spacingBetweenStacks
        return view
    }()
    
    private lazy var translucentBackgroundView: WCUIView = {
        let view = WCUIView(frame: .zero)
        view.backgroundColor = .gray
        return view
    }()
    
    private var doneAction: (() -> Void)?
    private var cancelAction: (() -> Void)?
    private var topController: UIViewController?
    private var dialogType: DialogType = .successNotification
    
    private let defaultBorderColor = UIColor.black.cgColor
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func customConfigs() {
        backgroundColor = ThemeColors.hexfdfefe.rawValue
        layer.cornerRadius = Constants.radius
    }
    
    public func setup() {
        if let controller = topController {
            self.bounds = UIScreen.main.bounds
            showTranslucentView(contentView: controller.view)
            constraintUI(in: controller.view)
        }
    }
    
    public func show(dialogType: DialogType = .interaction,
                     in viewController: UIViewController,
                     title: String,
                     description: String,
                     doneText: String,
                     cancelText: String = "",
                     doneAction: (() -> Void)? = nil,
                     cancelAction: (() -> Void)? = nil) {
        self.dialogType = dialogType
        self.topController = viewController
        self.doneAction = doneAction
        self.cancelAction = cancelAction
        setup()
        setupUI(textTitle: title, textDescription: description, buttonSuccessText: doneText, buttonCancelText: cancelText)
        fadeIn(0.1)
    }
    
    private func setupUI(iconNameImage: String? = nil,
                         textTitle: String,
                         textDescription: String,
                         buttonSuccessText: String? = nil,
                         buttonCancelText: String? = nil) {
        titleLbl.text = textTitle
        descriptionLbl.text = textDescription
        doneButton.text = buttonSuccessText
        cancelButton.text = buttonCancelText
        
        switch dialogType {
        case .errorNotification:
            titleLbl.textColor = ThemeColors.alertRed.rawValue
        case .interaction:
            titleLbl.textColor = ThemeColors.black.rawValue
        case .successNotification:
            titleLbl.textColor = ThemeColors.connectedGreen.rawValue
        }
    }
    
    public func hide(completion: @escaping () -> Void) {
        hideTranslucentView()
        fadeOut(0.1, completion: { _ in
            completion()
        })
    }
    
    @objc
    private func doneCallback() {
        hide { [unowned self] in
            self.removeFromSuperview()
            if let doneAction = doneAction {
                doneAction()
            }
        }
    }
    
    @objc
    private func cancelCallback() {
        hide { [unowned self] in
            self.removeFromSuperview()
            if let cancelAction = cancelAction {
                cancelAction()
            }
        }
    }
    
    private func constraintUI(in contentView: UIView) {
        contentView.addSubview(self)
        self.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(Constants.horizontalMargin)
        }
        applyViewCode()
    }
    
    private func showTranslucentView(contentView: UIView) {
        UIView.animate(withDuration: 0.1, animations: {
            contentView.addSubview(self.translucentBackgroundView)
            self.translucentBackgroundView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            self.translucentBackgroundView.alpha = 0.9
        })
    }
    
    private func hideTranslucentView() {
        UIView.animate(withDuration: 0.1, animations: {
            self.translucentBackgroundView.alpha = 0
        }, completion: { _ in
            self.translucentBackgroundView.removeFromSuperview()
        })
    }
}

extension WCDialogView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        labelStackView.addArrangedSubview(titleLbl)
        labelStackView.addArrangedSubview(descriptionLbl)
        buttonStackView.addArrangedSubview(doneButton)
        
        if dialogType == .interaction {
            buttonStackView.addArrangedSubview(cancelButton)
        }
    
        addSubview(labelStackView)
        addSubview(buttonStackView)
    }
    
    public func setupConstraints() {
        labelStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(11)
            make.left.right.equalToSuperview().inset(12)
        }
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(labelStackView.snp.bottom).offset(Constants.spacingBetweenStacks)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(12)
        }
        titleLbl.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
        }
        descriptionLbl.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
        }
        doneButton.snp.makeConstraints { make in
            make.width.equalTo(Constants.buttonWidth)
        }
        cancelButton.snp.makeConstraints { make in
            make.width.equalTo(Constants.buttonWidth)
        }
    }
}
