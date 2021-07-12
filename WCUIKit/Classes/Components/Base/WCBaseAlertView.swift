//
//  WCBaseAlertView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 11/07/21.
//

import UIKit

public class WCBaseAlertView: WCUIView {
    
    private enum Constants {
        static let radius: CGFloat = 8
        static let horizontalMargin: CGFloat = 48
    }
    
    private var doneAction: (() -> Void)?
    private var cancelAction: (() -> Void)?
    private var topController: UIViewController?
    
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

extension WCBaseAlertView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        
    }
}
