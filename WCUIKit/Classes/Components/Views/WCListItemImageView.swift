//
//  WCImageView.swift
//  WeCam
//
//  Created by Pedro Alvarez on 10/04/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit
import SDWebImage

@objc
public protocol WCListItemImageViewDelegate: AnyObject {
    @objc optional func didLoadImage(imageView: WCListItemImageView)
}

public class WCListItemImageView: UIImageView {
    
    public weak var delegate: WCListItemImageViewDelegate?
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        layer.cornerRadius = frame.width / 2
        contentMode = .scaleAspectFill
        applyViewCode()
    }
    
    public func setImage(withURL url: String) {
        sd_imageIndicator = SDWebImageActivityIndicator.gray
        sd_setImage(with: URL(string: url), completed: { _,_,_,_ in
            self.delegate?.didLoadImage?(imageView: self)
        })
    }
    
    public func setImage(named string: String) {
        sd_imageIndicator = nil
        image = UIImage(named: string)
    }
}

extension WCListItemImageView: ViewCodeProtocol {
    
    public func buildViewHierarchy() { }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(snp.width)
        }
    }
}
