//
//  ViewCodeProtocol.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 01/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

public protocol ViewCodeProtocol {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

public extension ViewCodeProtocol {
    
    func applyViewCode() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() { }
}
