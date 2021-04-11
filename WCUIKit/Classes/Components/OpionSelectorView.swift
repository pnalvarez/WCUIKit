//
//  OpionSelectorView.swift
//  WeCam
//
//  Created by Pedro Alvarez on 27/02/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

protocol OptionSelectorViewDelegate: class {
    func didSelectOption(optionSelectorView: OptionSelectorView, index: Int)
}

class OptionSelectorView: UIView {
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 38
        return view
    }()
    
    private var options: [String]? {
        didSet {
            guard let options = options else { return }
            for option in options {
                let optionView = OptionView(frame: .zero)
                optionViews.append(optionView)
                mainStackView.addArrangedSubview(optionView)
                optionView.setup(delegate: self,
                                 optionText: option)
            }
        }
    }
    
    private var optionViews: [OptionView] = []
    
    weak var delegate: OptionSelectorViewDelegate?
    
    func setup(options: [String]) {
        self.options = options
        applyViewCode()
    }
}

extension OptionSelectorView: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        addSubview(mainStackView)
    }
    
    func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

extension OptionSelectorView: OptionViewDelegate {
    
    func didTapOptionView(selectedOptionView: OptionView, enabled: Bool) {
        for optionView in optionViews {
            if optionView != selectedOptionView {
                optionView.setState(.disabled)
            }
        }
        guard let index = optionViews.firstIndex(where: { $0 == selectedOptionView }) else { return }
        delegate?.didSelectOption(optionSelectorView: self, index: index)
    }
}
