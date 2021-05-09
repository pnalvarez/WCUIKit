//
//  DefaultCloseButton.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 22/08/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public class WCCloseButton: UIButton {
    
    public enum Layout {
        case small
        case medium

        var dimension: CGFloat {
            switch self {
            case .small:
                return Constants.smallDimension
            case .medium:
                return Constants.mediumDimension
            }
        }
    }
    
    public enum Context {
        case modal
        case component(callback: () -> Void)
    }
    
    private enum Constants {
        static let smallDimension: CGFloat = 14
        static let mediumDimension: CGFloat = 31
    }
    
    public var associatedViewController: UIViewController?
    public var layout: Layout
    public var context: Context = .modal
    
    public init(frame: CGRect,
                layout: Layout = .medium) {
        self.layout = layout
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setImage(UIImage(named: "fechar 1",
                         in: nil,
                         compatibleWith: nil),
                 for: .normal)
        addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        applyViewCode()
    }
    
    @objc
    private func closeAction() {
        switch context {
        case .modal:
            if let navigationController = associatedViewController?.navigationController {
                navigationController.dismiss(animated: true, completion: nil)
            } else {
                associatedViewController?.dismiss(animated: true, completion: nil)
            }
        case .component(let callback):
            callback()
        }
    }
}

extension WCCloseButton: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.width.equalTo(layout.dimension)
        }
    }
}
