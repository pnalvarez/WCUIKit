//
//  WCInternetErrorConnectionView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 29/04/21.
//

import UIKit

public protocol WCInternetErrorConnectionViewDelegate: AnyObject {
    func didTapTryAgain()
}

public class WCInternetErrorConnectionView: WCUIView {
    
    private enum Strings {
        static let connectionLost = "Você perdeu a conexão com a internet."
        static let alert = "alert"
        static let exclamation = "!"
        static let tryAgain = "Tentar novamente"
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
        view.text = Strings.connectionLost
        view.textAlignment = .center
        return view
    }()

    private lazy var tryAgainButton: WCFunctionalButton16 = {
        let view = WCFunctionalButton16(frame: .zero)
        view.addTarget(self, action: #selector(didTapTryAgain), for: .touchUpInside)
        view.text = Strings.tryAgain.uppercased()
        return view
    }()
    
    public override var isHidden: Bool {
        didSet {
            if !isHidden {
                if let superview = self.superview {
                    superview.bringSubviewToFront(self)
                }
            }
        }
    }
    
    public weak var delegate: WCInternetErrorConnectionViewDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        alertContainerImageView.layer.cornerRadius = alertContainerImageView.frame.height / 2
        exclamationImageView.layer.cornerRadius = exclamationImageView.frame.width / 2
    }
    
    @objc
    private func didTapTryAgain() {
        delegate?.didTapTryAgain()
    }
}

extension WCInternetErrorConnectionView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        alertContainerImageView.addSubview(exclamationImageView)
        addSubview(alertContainerImageView)
        addSubview(messageLbl)
        addSubview(tryAgainButton)
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
            make.bottom.equalTo(tryAgainButton.snp.top).offset(-40)
            make.width.equalTo(260)
        }
        tryAgainButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(21)
            make.width.equalTo(180)
        }
    }
}

