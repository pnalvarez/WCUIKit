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
        static let buttonSpacing: CGFloat = 12
        static let spacingBetweenStacks: CGFloat = 32
        static let radius: CGFloat = 14
        static let buttonWidth: CGFloat = 150
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
    
    private var doneAction: (() -> Void)?
    private var cancelAction: (() -> Void)?
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func customConfigs() {
        backgroundColor = .white
    }
    
    public func setup() {
        if var topController = UIApplication.shared.delegate?.window??.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            self.bounds = UIScreen.main.bounds
            topController.view.addSubview(self)
        }
    }
    
    public func show(in contentView: UIView,
                     title: String,
                     description: String,
                     doneText: String,
                     cancelText: String,
                     doneAction: @escaping () -> Void,
                     cancelAction: @escaping () -> Void) {
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
    }
    
    public func hide(completion: @escaping () -> Void) {
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
}

extension WCDialogView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        labelStackView.addArrangedSubview(titleLbl)
        labelStackView.addArrangedSubview(descriptionLbl)
        buttonStackView.addArrangedSubview(doneButton)
        buttonStackView.addArrangedSubview(cancelButton)
        addSubview(labelStackView)
        addSubview(buttonStackView)
    }
    
    public func setupConstraints() {
        labelStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(11)
            make.left.right.equalToSuperview()
        }
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(labelStackView.snp.bottom).offset(Constants.spacingBetweenStacks)
            make.left.right.bottom.equalToSuperview()
        }
        doneButton.snp.makeConstraints { make in
            make.width.equalTo(Constants.buttonWidth)
        }
        cancelButton.snp.makeConstraints { make in
            make.width.equalTo(Constants.buttonWidth)
        }
    }
}
