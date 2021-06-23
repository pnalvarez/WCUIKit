//
//  WCRelevantItemImageView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 08/05/21.
//

import UIKit
import SDWebImage

@objc
public protocol WCRelevantItemImageViewDelegate: AnyObject {
    @objc optional func didLoadImage(imageView: WCRelevantItemImageView)
    func didTapImageView(imageView: WCRelevantItemImageView)
}

public class WCRelevantItemImageView: UIImageView {
    
    public enum ImageType {
        case local
        case url
    }
    
    private enum Constants {
        static let cornerRadius: CGFloat = 16
        static let height: CGFloat = 180
    }
    
    public var imageType: ImageType = .local
    public weak var delegate: WCRelevantItemImageViewDelegate?
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        isUserInteractionEnabled = true
        clipsToBounds = true
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = ThemeColors.hexededed.rawValue
        contentMode = .scaleToFill
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        applyViewCode()
    }
    
    public func setupImage(_ image: String) {
        switch imageType {
        case .local:
            sd_imageIndicator = nil
            self.image = UIImage(named: image)
        case .url:
            sd_imageIndicator = SDWebImageActivityIndicator.gray
            sd_setImage(with: URL(string: image), completed: { _,_,_,_ in
                self.delegate?.didLoadImage?(imageView: self)
            })
        }
    }
    
    @objc
    private func didTap() {
        delegate?.didTapImageView(imageView: self)
    }
}

extension WCRelevantItemImageView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(Constants.height)
        }
    }
}
