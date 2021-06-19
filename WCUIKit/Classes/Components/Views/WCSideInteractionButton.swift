//
//  WCSideInteractionButton.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 03/06/21.
//

import UIKit

public class WCSideInteractionButton: WCBaseButton{
    
    private enum Constants {
        static let dimensions: CGFloat = 31
    }
    
    private var image: String = "" {
        didSet {
            setImage(UIImage(named: image), for: .normal)
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        applyViewCode()
    }
    
    public func setImage(_ image: String) {
        self.image = image
    }
}

extension WCSideInteractionButton: ViewCodeProtocol {
    
    public func buildViewHierarchy() { }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.width.equalTo(Constants.dimensions)
        }
    }
}
