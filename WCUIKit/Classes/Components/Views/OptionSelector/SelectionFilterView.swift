//
//  SelectionFilterView.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 11/10/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public protocol SelectionFilterViewDelegate: AnyObject {
    func didTapBottomSheetButton()
}

public class SelectionFilterView: UIView {
    
    private lazy var itemLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = selectedItem
        view.textAlignment = .left
        view.textColor = ThemeColors.alertGray.rawValue
        view.font = ThemeFonts.RobotoBold(12).rawValue
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ThemeColors.dividerGray.rawValue
        return view
    }()
    
    private lazy var changeButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.addTarget(self, action: #selector(didTapChange), for: .touchUpInside)
        view.setImage(UIImage(named: "seta-filtragem 1", in: nil, compatibleWith: nil), for: .normal)
        return view
    }()
    
    public var selectedItem: String {
        didSet {
            itemLbl.text = selectedItem
        }
    }
    private weak var delegate: SelectionFilterViewDelegate?
    
    public init(frame: CGRect,
         selectedItem: String,
         delegate: SelectionFilterViewDelegate? = nil) {
        self.selectedItem = selectedItem
        self.delegate =
            delegate
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectionFilterView {
    
    @objc
    private func didTapChange() {
        delegate?.didTapBottomSheetButton()
    }
}

extension SelectionFilterView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(itemLbl)
        addSubview(dividerView)
        addSubview(changeButton)
    }
    
    public func setupConstraints() {
        itemLbl.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(2)
            make.right.equalTo(dividerView.snp.left).offset(-2)
        }
        dividerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().inset(30)
            make.width.equalTo(1)
        }
        changeButton.snp.makeConstraints { make in
            make.left.equalTo(dividerView.snp.right)
            make.top.bottom.right.equalToSuperview()
        }
    }
    
    public func configureViews() {
        layer.borderWidth = 1
        layer.borderColor = ThemeColors.hexe3e0e0.rawValue.cgColor
        layer.cornerRadius = 4
        backgroundColor = .white
        clipsToBounds = true
    }
}
