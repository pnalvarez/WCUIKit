//
//  UIAlertController+.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 15/08/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit
import WCUIKit

public extension UIAlertController {
    
    static func displayAlert(in controller: UIViewController,
                             title: String,
                             message: String = "",
                             completion: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: completion)
        alertAction.setValue(ThemeColors.mainRedColor.rawValue, forKey: "titleTextColor")
        alertController.addAction(alertAction)

        controller.present(alertController,
                           animated: true)
    }
    
    static func displayAlert(title: String,
                             message: String,
                             completion: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: completion)
        alertAction.setValue(ThemeColors.mainRedColor.rawValue, forKey: "titleTextColor")
        alertController.addAction(alertAction)
        
        let win = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        win.rootViewController = vc
        win.windowLevel = UIWindow.Level.alert + 1
        win.makeKeyAndVisible()
        vc.present(alertController, animated: true, completion: nil)
    }
    
    static func displayConfirmationDialog(in controller: UIViewController,
                                          title: String,
                                          message: String,
                                          confirmOption: String = "Confirmar",
                                          refuseOption: String = "Não",
                                          confirmationCallback: @escaping () -> Void,
                                          refuseCallback: (() -> Void)? = nil,
                                          animated: Bool) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: confirmOption,
                                          style: .default,
                                          handler: { _ in
                                            confirmationCallback()
                                          })
        let refuseAction = UIAlertAction(title: refuseOption,
                                         style: .default, handler: { _ in
                                            guard let callback = refuseCallback else {
                                                return
                                            }
                                            callback()
                                         })
        confirmAction.setValue(ThemeColors.mainRedColor.rawValue, forKey: "titleTextColor")
        alertController.addAction(refuseAction)
        alertController.addAction(confirmAction)
        
        controller.present(alertController, animated: animated)
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        for i in self.actions {
            let attributedText = NSAttributedString(string: "OK",
                                                    attributes: [NSAttributedString.Key.font: ThemeFonts.RobotoBold(18).rawValue, NSAttributedString.Key.foregroundColor: ThemeColors.mainRedColor.rawValue])
            guard let label = (i.value(forKey: "__representer") as AnyObject).value(forKey: "label") as? UILabel else { return }
            label.attributedText = attributedText
        }

    }
}
