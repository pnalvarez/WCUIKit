//
//  WCProgressView.swift
//  WeCam
//
//  Created by Pedro Alvarez on 11/04/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

public protocol WCProgressViewDelegate: AnyObject {
    func didChangeValue(_ progressView: WCProgressView, percentage: Float)
}

public class WCProgressView: WCUIView {
    
    private enum Constants {
        static let imageThumbSize = CGSize(width: 80, height: 94)
        static let hundredPercent: Float = 100
    }
    
    private enum Strings {
        static let imageLogo = "logo-apenas"
        static let percentageFormat = "%@ %"
    }
    
    private lazy var slider: UISlider = {
        let view = UISlider(frame: .zero)
        view.setThumbImage(UIImage.imageWithImage(image: UIImage(named: Strings.imageLogo) ?? UIImage(), scaledToSize: Constants.imageThumbSize), for: .normal)
        view.setThumbImage(UIImage.imageWithImage(image: UIImage(named: "logo-apenas") ?? UIImage(), scaledToSize: Constants.imageThumbSize), for: .highlighted)
        view.backgroundColor = ThemeColors.dividerGray.rawValue
        view.tintColor = ThemeColors.dividerGray.rawValue
        view.addTarget(self, action: #selector(didChangeSliderValue), for: .valueChanged)
        return view
    }()
    
    private lazy var percentageLbl: WCUILabelRobotoRegular16 = {
        let view = WCUILabelRobotoRegular16(frame: .zero)
        view.textAlignment = .center
        view.text = "\(Int(percentage * Constants.hundredPercent)) %"
        return view
    }()
    
    public private(set) var percentage: Float {
        didSet {
            setNeedsLayout()
        }
    }
    
    public weak var delegate: WCProgressViewDelegate?
    
    public init(frame: CGRect,
                percentage: Float = 0.0) {
        self.percentage = percentage
        super.init(frame: frame)
        applyViewCode()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        percentageLbl.text = "\(Int(percentage * Constants.hundredPercent)) %"
        slider.value = percentage
        delegate?.didChangeValue(self, percentage: percentage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupProgress(_ progress: Float) {
        percentage = progress
    }
    
    @objc
    private func didChangeSliderValue() {
        percentage = slider.value / slider.maximumValue
    }
}

extension WCProgressView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(slider)
        addSubview(percentageLbl)
    }
    
    public func setupConstraints() {
        percentageLbl.snp.makeConstraints { make in
            make.top.equalTo(slider.snp.bottom).offset(60)
            make.left.right.equalToSuperview()
        }
        slider.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(57)
            make.right.equalToSuperview().inset(52)
            make.height.equalTo(11)
        }
    }
}
