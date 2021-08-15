//
//  WCFeedListErrorView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 15/08/21.
//

import UIKit

public class WCFeedListErrorView: WCUIView {
    
    private enum Strings {
        static let alert = "alert"
        static let exclamation = "!"
    }
    
    private lazy var alertContainerImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: Strings.alert)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var exclamationImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: Strings.exclamation)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var messageLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = ThemeFonts.RobotoRegular(15).rawValue
        view.textColor = ThemeColors.hex707070.rawValue
        view.textAlignment = .center
        return view
    }()
    
    private lazy var actionButton: WCPrimaryActionButton = {
        let view = WCPrimaryActionButton(frame: .zero)
        view.addTarget(self, action: #selector(didTapAction), for: .touchUpInside)
        return view
    }()
    
    private var topController: UIViewController?
    private var mainAction: (() -> Void)?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func show(in topController: UIViewController,
              message: String,
              action: String,
              mainAction: (() -> Void)? = nil) {
        self.topController = topController
        messageLbl.text = message
        actionButton.text = action
        self.mainAction = mainAction
        constraintUI()
    }
    
    private func constraintUI() {
        if let contentView = topController?.view {
            contentView.addSubview(self)
            snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
    
    @objc
    private func didTapAction() {
        removeFromSuperview()
        if let action = mainAction {
            action()
        }
    }
}

extension WCFeedListErrorView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        alertContainerImageView.addSubview(exclamationImageView)
        addSubview(alertContainerImageView)
        addSubview(messageLbl)
        addSubview(actionButton)
    }
    
    public func setupConstraints() {
        alertContainerImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(messageLbl.snp.top).offset(-37)
            make.height.width.equalTo(100)
        }
        exclamationImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(20)
        }
        messageLbl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(actionButton.snp.top).offset(-40)
            make.width.equalTo(260)
        }
        actionButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(180)
        }
    }
    
    public func configureViews() {
        backgroundColor = .white
    }
}
