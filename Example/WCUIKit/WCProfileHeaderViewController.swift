//
//  WCProfileHeaderViewController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 03/06/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCProfileHeaderViewController: UIViewController {
    
    private lazy var testView: WCProfileHeaderView = {
        let view = WCProfileHeaderView(frame: .zero)
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testView.setup(profileImage: "lumiere-b1a80.appspot.com/profile_images/0F57MU5bOfaRyEdl8n72ozqhNWj2",
                       name: "Name Name Name Name Name",
                       email: "email@hotmail.com",
                       phoneNumber: "(11)34587353",
                       ocupation: "Artista",
                       relation: .loggedUser)
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCProfileHeaderViewController: WCProfileHeaderViewDelegate {
    
    func didTapRelationInteractionButton(relationState: WCProfileHeaderView.RelationState,
                                         profileHeaderView: WCProfileHeaderView) {
        
    }
    
    func didTapInviteToProjects(profileHeaderView: WCProfileHeaderView) {
        
    }
    
    func didTapConnections(profileHeaderView: WCProfileHeaderView) {
        
    }
    
    func didTapEditProfile(profileHeaderView: WCProfileHeaderView) {
        
    }
}

extension WCProfileHeaderViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testView)
    }
    
    func setupConstraints() {
        testView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }
    }
}
