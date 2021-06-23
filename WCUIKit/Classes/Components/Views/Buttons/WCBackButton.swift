//
//  DefaultBackButton.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 21/08/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public class WCBackButton: WCSideInteractionButton {
    
    public weak var associatedViewController: UIViewController?

    override public func layoutSubviews() {
        super.layoutSubviews()
        setImage("voltar 1")
        addTarget(self, action: #selector(backAction), for: .touchUpInside)
        applyViewCode()
    }
    
    @objc
    private func backAction() {
        associatedViewController?.navigationController?.popViewController(animated: true)
    }
}
