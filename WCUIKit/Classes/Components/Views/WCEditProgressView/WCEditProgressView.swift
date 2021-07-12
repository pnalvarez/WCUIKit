//
//  EditProgressView.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 19/09/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public class WCEditProgressView: WCUIView {
    
    private enum Strings {
        static let concludedText = "Concluído"
    }
    
    private enum Constants {
        static let radius: CGFloat = 8
        static let horizontalMargin: CGFloat = 48
    }
    
    private lazy var closeButton: WCCloseButton = {
        let view = WCCloseButton(frame: .zero, context: .component(callback: cancelCallback))
        return view
    }()
    
    private lazy var mainLbl: WCUILabelRobotoBold18Black = {
        let view = WCUILabelRobotoBold18Black(frame: .zero)
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var progressView: WCProgressView = {
        let view = WCProgressView(frame: .zero)
        return view
    }()
    
    private lazy var finishButton: WCPrimaryActionButton = {
        let view = WCPrimaryActionButton(frame: .zero)
        view.addTarget(self, action: #selector(doneCallback), for: .touchUpInside)
        view.text = Strings.concludedText
        return view
    }()
    
    public var progress: Float = 0.0 {
        didSet {
            progressView.percentage = progress/100
        }
    }
    
    private var doneAction: (() -> Void)?
    private var cancelAction: (() -> Void)?
    private var topController: UIViewController?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func customConfigs() {
        backgroundColor = ThemeColors.hexfdfefe.rawValue
        layer.cornerRadius = Constants.radius
    }
    
    public func show(in viewController: UIViewController,
              text: String,
              progress: Float,
              doneAction: (() -> Void)? = nil,
              cancelAction: (() -> Void)? = nil) {
        self.topController = viewController
        self.progress = progress
        self.doneAction = doneAction
        self.cancelAction = cancelAction
        mainLbl.text = text
        setup()
        fadeIn(0.1)
    }
    
    private func setup() {
        if let controller = topController {
            self.bounds = UIScreen.main.bounds
            showTranslucentView(in: controller.view)
            constraintUI(in: controller.view)
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
}

extension WCEditProgressView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(closeButton)
        addSubview(mainLbl)
        addSubview(progressView)
        addSubview(finishButton)
    }
    
    public func setupConstraints() {
        closeButton.snp.makeConstraints { make in
            make.top.right.equalToSuperview().inset(12)
        }
        mainLbl.snp.makeConstraints { make in
            make.top.equalTo(closeButton.snp.bottom).offset(19)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(mainLbl).offset(64)
            make.right.left.equalToSuperview()
            make.height.equalTo(96)
        }
        finishButton.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(120)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(94)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    public func configureViews() {
        backgroundColor = .white
    }
}
