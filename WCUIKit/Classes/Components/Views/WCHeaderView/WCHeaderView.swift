//
//  DefaultHeaderView.swift
//  WeCam
//
//  Created by Pedro Alvarez on 25/02/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

public class WCHeaderView: UIImageView {
    
    private enum Constants {
        static let height: CGFloat = 36
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        image = UIImage(named: "tipografia-projeto 2")
        sizeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WCHeaderView: AutoSizable {
    
    func sizeConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(Constants.height)
        }
    }
}
