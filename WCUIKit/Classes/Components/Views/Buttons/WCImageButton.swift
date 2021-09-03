//
//  WCImageButton.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 28/08/21.
//

import UIKit
import Photos

public protocol WCImageButtonDelegate: AnyObject {
    func didChangeButtonImage(_ view: WCImageButton)
}

public class WCImageButton: UIButton {
    
    public enum State {
        case `default`
        case error
        
        var layerColor: CGColor {
            switch self {
            case .default:
                return ThemeColors.hexe3e0e0.rawValue.cgColor
            case .error:
                return ThemeColors.alertRed.rawValue.cgColor
            }
        }
    }
    
    private enum Strings {
        static let cameraImage = "photo 1"
    }
    
    private enum Constants {
        static let borderWidth: CGFloat = 1
    }
    
    public weak var delegate: WCImageButtonDelegate?
             
    private var buttonState: State = .default {
        didSet {
            layer.borderColor = buttonState.layerColor
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = ThemeColors.hexe3e0e0.rawValue.cgColor
        backgroundColor = .white
        imageView?.contentMode = .scaleAspectFill
        addTarget(self, action: #selector(didTapImageButton), for: .touchUpInside)
        setImage(UIImage(named: Strings.cameraImage), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2
    }
    
    public func setState(_ state: State) {
        self.buttonState = state
    }
    
    @objc
    func didTapImageButton() {
        delegate?.didChangeButtonImage(self)
    }
}
