//
//  WCToastView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 21/06/21.
//

import UIKit

public class WCToastView: WCUIView {
    
    public enum Status {
        case success
        case error
        case attention
        
        var color: UIColor {
            switch self {
            case .success:
                return ThemeColors.connectedGreen.rawValue
            case .error:
                return ThemeColors.alertRed.rawValue
            case .attention:
                return ThemeColors.attentionYellow.rawValue
            }
        }
    }
    
    private enum Constants {
        static let height: CGFloat = 48
        static let radius: CGFloat = 8
    }
    
    private lazy var titleLbl: WCUILabelRobotoMedium14Black = {
        let view = WCUILabelRobotoMedium14Black(frame: .zero)
        view.numberOfLines = 2
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var contentView: UIView?
    
    private var status: Status = .success {
        willSet {
            updateUIStatus()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func customConfigs() {
        backgroundColor = ThemeColors.connectedGreen.rawValue
        layer.cornerRadius = Constants.radius
    }
    
    public func show(withTitle text: String? = nil,
                     status: Status = .success,
                     in contentView: UIView,
                     successAction: (() -> Void)? = nil,
                     cancelAction: (() -> Void)? = nil) {
        self.contentView = contentView
        customConfigs()
        self.titleLbl.text = text
        self.status = status
        applyViewCode()
        fadeIn(0.1)
        fadeOut(0.1, withDelay: 2.5, completion: { success in
            success ? successAction?() : cancelAction?()
        })
    }
    
    private func updateUIStatus() {
        backgroundColor = status.color
    }
}

extension WCToastView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(titleLbl)
        contentView?.addSubview(self)
    }
    
    public func setupConstraints() {
        titleLbl.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
        }
        snp.makeConstraints { make in
            make.height.equalTo(Constants.height)
            make.left.right.bottom.equalToSuperview().inset(24)
        }
    }
}
