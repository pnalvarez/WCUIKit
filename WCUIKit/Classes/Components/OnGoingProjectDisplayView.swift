//
//  OnGoingProjectDisplayView.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 01/09/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit
import SDWebImage

public class OnGoingProjectDisplayView: UIView {
    
    private lazy var mainButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.layer.cornerRadius = 52
        view.clipsToBounds = true
        view.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.sd_setImage(with: URL(string: projectImage), for: .normal, completed: nil)
        return view
    }()
    
    private var projectImage: String
    public var callback: (() -> Void)?
    
    init(frame: CGRect,
         projectImage: String) {
        self.projectImage = projectImage
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnGoingProjectDisplayView {
    
    @objc
    private func didTap() {
        guard let callback = callback else {
            return
        }
        callback()
    }
}

extension OnGoingProjectDisplayView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(mainButton)
    }
    
    public func setupConstraints() {
        mainButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(104)
            make.width.equalTo(104)
        }
    }
    
    public func configureViews() {
        backgroundColor = .white
    }
}
