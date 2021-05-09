//
//  WCBulletEditableItemView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 09/05/21.
//

import UIKit

@objc
public protocol WCBulletEditableItemViewDelegate: AnyObject {
    func didTapCancel(text: String, bulletEditableView: WCBulletEditableItemView)
    @objc optional func didTapClose(bulletEditableView: WCBulletEditableItemView)
}

public class WCBulletEditableItemView: UIView {
    
    public enum State {
        case `default`
        case editing
        case disabled
        
        var auxiliarButtonText: String {
            switch self {
            case .default:
                return "Editar"
            case .editing:
                return "Salvar"
            case .disabled:
                return ""
            }
        }
        
        var closeButtonIsHidden: Bool {
            return self != .editing
        }
        
        var editButtonIsHidden: Bool {
            return self == .disabled
        }
        
        var interactionEnabled: Bool {
            return self == .editing
        }
    }

    private lazy var bulletView: WCContentView = {
        let view = WCContentView(frame: .zero)
        view.style = .red
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var mainTextLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.textAlignment = .left
        view.textColor = ThemeColors.hex707070.rawValue
        view.font = ThemeFonts.RobotoRegular(16).rawValue
        return view
    }()
    
    private lazy var infoContainer: UIView = {
        let view = UIView(frame: .zero)
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = ThemeColors.hexe3e0e0.rawValue.cgColor
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var infoTextView: UITextView = {
        let view = UITextView(frame: .zero, textContainer: nil)
        view.font = ThemeFonts.RobotoRegular(16).rawValue
        view.layer.borderWidth = 0
        view.isUserInteractionEnabled = false
        view.textColor = ThemeColors.black.rawValue
        view.textAlignment = .left
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fill
        view.spacing = 8
        return view
    }()
    
    private lazy var editButton: WCSmallAuxiliarButton = {
        let view = WCSmallAuxiliarButton(frame: .zero)
        view.addTarget(self, action: #selector(didTapEdit), for: .touchUpInside)
        return view
    }()
    
    private lazy var closeButton: WCCloseButton = {
        let view = WCCloseButton(frame: .zero, layout: .small)
        view.context = .component(callback: {
            self.state = .default
        })
        return view
    }()
    
    public var state: State = .default {
        didSet {
            updateUI()
        }
    }
    
    private var headerText: String?
    private var needingText: String?
    public weak var delegate: WCBulletEditableItemViewDelegate?
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        bulletView.layer.cornerRadius = bulletView.frame.width / 2
        updateUI()
    }
    
    public func setup(headerText: String, needingText: String) {
        self.headerText = headerText
        self.needingText = needingText
        applyViewCode()
    }
    
    private func updateUI() {
        editButton.text = state.auxiliarButtonText
        editButton.isHidden = state.editButtonIsHidden
        closeButton.isHidden = state.closeButtonIsHidden
        infoTextView.isUserInteractionEnabled = state.interactionEnabled
    }
    
    @objc
    private func didTapEdit() {
        if state == .default {
            state = .editing
        } else if state == .editing {
            delegate?.didTapCancel(text: infoTextView.text ?? "", bulletEditableView: self)
        }
    }
}

extension WCBulletEditableItemView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(bulletView)
        addSubview(mainTextLbl)
        infoContainer.addSubview(infoTextView)
        buttonStackView.addArrangedSubview(editButton)
        buttonStackView.addArrangedSubview(closeButton)
        infoContainer.addSubview(buttonStackView)
        addSubview(infoContainer)
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(140)
        }
        bulletView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.height.width.equalTo(10)
        }
        mainTextLbl.snp.makeConstraints { make in
            make.centerY.equalTo(bulletView)
            make.left.equalTo(bulletView.snp.right).offset(11)
            make.right.equalToSuperview()
        }
        infoContainer.snp.makeConstraints { make in
            make.top.equalTo(bulletView.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        } 
        infoTextView.snp.makeConstraints { make in
            make.top.right.equalToSuperview()
            make.left.equalToSuperview().inset(4)
            make.bottom.equalToSuperview().inset(40)
        }
        buttonStackView.snp.makeConstraints { make in
            make.bottom.right.equalToSuperview().inset(4)
        }
        editButton.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
    }
    
    public func configureViews() {
        mainTextLbl.text = headerText
        infoTextView.text = needingText
    }
}
