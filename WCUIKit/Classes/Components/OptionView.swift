//
//  OptionView.swift
//  WeCam
//
//  Created by Pedro Alvarez on 27/02/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit
import SnapKit

public protocol OptionViewDelegate: class {
    func didTapOptionView(selectedOptionView: OptionView, enabled: Bool)
}

public class OptionView: UIView {
    
    public enum State: String {
        case enabled = "fazer-conexao 1"
        case disabled = "icone-usuario-participante"
    }
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 8
        return view
    }()
    
    private lazy var selectionButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.addTarget(self, action: #selector(didTapSelectionButton), for: .touchUpInside)
        view.setImage(UIImage(named: "fazer-conexao 1"), for: .normal)
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var optionLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.textAlignment = .center
        view.backgroundColor = ThemeColors.backgroundGray.rawValue
        view.font = ThemeFonts.RobotoRegular(12).rawValue
        view.textColor = ThemeColors.black.rawValue
        return view
    }()
    
    private weak var delegate: OptionViewDelegate?
    
    private var state: State = .disabled {
        didSet {
            selectionButton.setImage(UIImage(named: state.rawValue), for: .normal)
        }
    }
    
    private var optionText: String?
    
    public func setup(delegate: OptionViewDelegate? = nil,
               state: State = .disabled,
               optionText: String) {
        self.delegate = delegate
        self.state = state
        self.optionText = optionText
        applyViewCode()
    }
    
    public func setState(_ state: State) {
        self.state = state
    }
    
    @objc
    private func didTapSelectionButton() {
        switch state {
        case .disabled:
            state = .enabled
            delegate?.didTapOptionView(selectedOptionView: self, enabled: false)
        case .enabled:
            state = .disabled
            delegate?.didTapOptionView(selectedOptionView: self, enabled: true)
        }
    }
}

extension OptionView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        mainStackView.addArrangedSubview(selectionButton)
        mainStackView.addArrangedSubview(optionLbl)
        addSubview(mainStackView)
    }
    
    public func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        selectionButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.height.equalTo(21)
        }
        optionLbl.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(183)
        }
    }
}
