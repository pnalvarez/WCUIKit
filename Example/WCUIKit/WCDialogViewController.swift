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
    
    private lazy var buttonSuccess: WCAuxiliarActionButton = {
        let view = WCAuxiliarActionButton(frame: .zero)
        view.text = "Show Success"
        view.addTarget(self, action: #selector(didTapSuccess), for: .touchUpInside)
        return view
    }()
    
    private lazy var buttonInteraction: WCAuxiliarActionButton = {
        let view = WCAuxiliarActionButton(frame: .zero)
        view.text = "Show Interaction"
        view.addTarget(self, action: #selector(didTapInteraction), for: .touchUpInside)
        return view
    }()
    
    private lazy var buttonError: WCAuxiliarActionButton = {
        let view = WCAuxiliarActionButton(frame: .zero)
        view.text = "Show Error"
        view.addTarget(self, action: #selector(didTapError), for: .touchUpInside)
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.distribution = .fill
        view.spacing = 24
        view.alignment = .center
        view.axis = .vertical
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
    
    @objc
    private func didTapSuccess() {
        WCDialogView().show(dialogType: .successNotification(doneText: "Ok"),
                            in: self,
                            title: "Título",
                            description: "Descrição")
    }
    
    @objc
    private func didTapInteraction() {
        WCDialogView().show(dialogType: .interaction(confirmText: "Ok", cancelText: "Cancelar"),
                      in: self,
                      title: "Título",
                      description: "Descrição")
    }
    
    @objc
    private func didTapError() {
        WCDialogView().show(dialogType: .errorNotification(doneText: "Ok"),
                      in: self,
                      title: "Título",
                      description: "Descrição")
    }
}

extension WCDialogViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        buttonStackView.addArrangedSubview(buttonSuccess)
        buttonStackView.addArrangedSubview(buttonInteraction)
        buttonStackView.addArrangedSubview(buttonError)
        view.addSubview(buttonStackView)
    }
    
    func setupConstraints() {
        buttonStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(24)
        }
        buttonSuccess.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
        }
        buttonInteraction.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
        }
        buttonError.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
        }
    }
}
