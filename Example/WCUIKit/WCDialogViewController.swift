//
//  WCDialogViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 19/06/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WCUIKit

final class WCDialogViewController: UIViewController {
    
    private lazy var testView: WCDialogView = {
        let view = WCDialogView(frame: .zero)
        return view
    }()
    
    private lazy var button: WCAuxiliarActionButton = {
        let view = WCAuxiliarActionButton(frame: .zero)
        view.text = "Show"
        view.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
    
    @objc
    private func didTap() {
        testView.show(dialogType: .successNotification,
                      in: self,
                      title: "Título",
                      description: "Descrição",
                      doneText: "Sucesso",
                      cancelText: "Cancelar")
    }
}

extension WCDialogViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(button)
    }
    
    func setupConstraints() {
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(24)
        }
    }
}
