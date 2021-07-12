//
//  WCBaseAlertView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 11/07/21.
//

import UIKit

public class WCBaseModalView: WCUIView {
    
    private enum Constants {
        static let radius: CGFloat = 8
        static let horizontalMargin: CGFloat = 48
    }
    
    var doneAction: (() -> Void)?
    var cancelAction: (() -> Void)?
    var topController: UIViewController?
    
    public func hide(completion: @escaping () -> Void) {
        hideTranslucentView()
        fadeOut(0.1, completion: { _ in
            completion()
        })
    }
    
    @objc
    func doneCallback() {
        hide { [unowned self] in
            self.removeFromSuperview()
            if let doneAction = doneAction {
                doneAction()
            }
        }
    }
    
    @objc
    func cancelCallback() {
        hide { [unowned self] in
            self.removeFromSuperview()
            if let cancelAction = cancelAction {
                cancelAction()
            }
        }
    }
    
    func setup(completion: (() -> Void)) {
        if let controller = topController {
            self.bounds = UIScreen.main.bounds
            showTranslucentView(in: controller.view)
            constraintUI(in: controller.view, completion: completion)
        }
    }
    
    private func constraintUI(in contentView: UIView, completion: (() -> Void)) {
        contentView.addSubview(self)
        self.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(Constants.horizontalMargin)
        }
        completion()
    }
}

