//
//  EditProgressView.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 19/09/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public protocol WCEditProgressViewDelegate: AnyObject {
    func didConfirm(progress: Float)
    func didClose()
}

public class WCEditProgressView: WCUIView {
    
    private lazy var notchView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 6
        view.backgroundColor = ThemeColors.hexe3e0e0.rawValue
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let view = WCCloseButton(frame: .zero)
        view.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        return view
    }()
    
    private lazy var mainLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Como está o progresso do seu projeto?"
        view.textAlignment = .center
        view.font = ThemeFonts.RobotoBold(18).rawValue
        view.textColor = .black
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var progressView: WCProgressView = {
        let view = WCProgressView(frame: .zero)
        return view
    }()
    
    private lazy var finishButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.addTarget(self, action: #selector(didTapFinish), for: .touchUpInside)
        view.layer.cornerRadius = 4
        view.backgroundColor = ThemeColors.mainRedColor.rawValue
        view.setTitle("Concluído", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = ThemeFonts.RobotoBold(16).rawValue
        return view
    }()
    
    private weak var delegate: WCEditProgressViewDelegate?
    
    public var progress: Float {
        didSet {
            progressView.percentage = progress/100
        }
    }
    
    public init(frame: CGRect,
         delegate: WCEditProgressViewDelegate? = nil,
         progress: Float = 0.0) {
        self.delegate = delegate
        self.progress = progress
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WCEditProgressView {
    
    @objc
    private func didTapClose() {
        delegate?.didClose()
    }
    
    @objc
    private func didTapFinish() {
        delegate?.didConfirm(progress: progressView.percentage)
    }
}

extension WCEditProgressView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(notchView)
        addSubview(mainLbl)
        addSubview(progressView)
        addSubview(finishButton)
    }
    
    public func setupConstraints() {
        notchView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(17)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(6)
        }
        mainLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(19)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(mainLbl).offset(64)
            make.right.left.equalToSuperview()
            make.height.equalTo(96)
        }
        finishButton.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(82)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(94)
        }
    }
    
    public func configureViews() {
        backgroundColor = .white
    }
}
