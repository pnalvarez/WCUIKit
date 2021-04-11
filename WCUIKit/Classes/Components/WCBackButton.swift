//
//  DefaultBackButton.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 21/08/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public class WCBackButton: UIButton {
    
    public weak var associatedViewController: UIViewController?

    override public func layoutSubviews() {
        super.layoutSubviews()
        setImage(UIImage(named: "voltar 1",
                         in: nil,
                         compatibleWith: nil),
                 for: .normal)
        addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    @objc
    private func backAction() {
        associatedViewController?.navigationController?.popViewController(animated: true)
    }
}
