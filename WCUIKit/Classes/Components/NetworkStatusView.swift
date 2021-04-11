//
//  NetworkStatusView.swift
//  WeCam
//
//  Created by Pedro Alvarez on 24/03/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

public enum NetworkStatusViewState {
    case connected
    case disconnected
    
    public var label: String {
        switch self {
        case .connected:
            return "Conexão reestabelecida"
        case .disconnected:
            return "Seu dispositivo encontra-se sem acesso a internet"
        }
    }
    
    public var iconImage: String {
        switch self {
        case .connected:
            return ""
        case .disconnected:
            return ""
        }
    }
    
    public var backgroundColor: UIColor {
        switch self {
        case .connected:
            return ThemeColors.connectedGreen.rawValue.withAlphaComponent(0.4)
        case .disconnected:
            return ThemeColors.disconnectedRed.rawValue.withAlphaComponent(0.4)
        }
    }
}

public class NetworkStatusView: UIView {
    
    private enum Constants {
        static let networkStatusViewHeight: CGFloat = 96
    }
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var statusLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.textAlignment = .center
        view.font = ThemeFonts.RobotoRegular(12).rawValue
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public var status: NetworkStatusViewState? {
        didSet {
            updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        applyViewCode()
    }
    
    private func displayInternetUnavailable() {
        if let superView = self.superview {
            self.snp.remakeConstraints { make in
                make.left.right.equalToSuperview()
                make.height.equalTo(Constants.networkStatusViewHeight)
                make.top.equalToSuperview()
            }
            UIView.animate(withDuration: 0.5, animations: {
                superView.layoutIfNeeded()
            })
        }
    }
    
    private func displayInternetAvailable() {
        if let superView = self.superview {
            self.snp.remakeConstraints { make in
                make.left.right.equalToSuperview()
                make.height.equalTo(Constants.networkStatusViewHeight)
                make.top.equalToSuperview().offset(-Constants.networkStatusViewHeight)
            }
            UIView.animate(withDuration: 0.5, delay: 2, animations: {
                superView.layoutIfNeeded()
            })
        }
    }
    
    private func updateUI() {
        DispatchQueue.main.async {
            self.statusLbl.text = self.status?.label
            self.iconImageView.image = UIImage(named: self.status?.iconImage ?? "")
            self.backgroundColor = self.status?.backgroundColor
            
            switch self.status ?? .connected {
            case .connected:
                self.displayInternetAvailable()
            case .disconnected:
                self.displayInternetUnavailable()
            }
        }
    }
}

extension NetworkStatusView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(iconImageView)
        addSubview(statusLbl)
    }
    
    public func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(24)
            make.height.width.equalTo(31)
        }
        statusLbl.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(20)
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.right.equalToSuperview()
        }
    }
}
