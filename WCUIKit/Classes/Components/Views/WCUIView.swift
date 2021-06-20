//
//  WCUIView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 19/06/21.
//

import UIKit

public class WCUIView: UIView {
    
    private enum Constants {
        static let borderRadius: CGFloat = 0
        static let borderWidth: CGFloat = 0
        static let shadowOpacity: Float = 0
    }
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = defaultBackgroundImage
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var defaultBackgroundImage: UIImage?
    var shadowColor = UIColor.green.cgColor
    var defaultBackgroundColor = UIColor.white
    var borderColor = UIColor.red.cgColor
    var shadowOffset: CGSize = CGSize(width: 0, height: 0)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        customConfigs()
        commonInit()
        constraintUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customConfigs() {
        
    }
    
    func reloadLayout() {
        commonInit()
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func fadeIn(_ duration: TimeInterval,
                completion: ((Bool) -> Void)? = nil) {
        alpha = 0
        isHidden = false
        UIView.animate(withDuration: duration,
                       animations: {
                        self.alpha = 1
                       }, completion: completion)
    }
    
    func fadeOut(_ duration: TimeInterval,
                 withDelay delay: TimeInterval = 0,
                 completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration,
                       animations: {
                        self.alpha = 0
                       }, completion: completion)
    }
    
    private func commonInit() {
//        configureBackground()
//        configureShadow()
//        configureBorder()
    }
    
    private func configureBackground() {
        if defaultBackgroundImage != nil {
            imageView.image = defaultBackgroundImage
        }
    }
    
    private func configureShadow() {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = Constants.borderRadius
        layer.shadowOpacity = Constants.shadowOpacity
    }
    
    private func configureBorder() {
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = borderColor
    }
    
    private func constraintUI() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
