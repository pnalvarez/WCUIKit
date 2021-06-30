//
//  WCUIScrollView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 29/06/21.
//

import UIKit

public class WCUIScrollView: UIScrollView {
    
    private enum Constants {
        static let minorPriority = 250
    }
    
    public enum ColorStyle {
        case white
        
        var color: WCContentView.ColorStyle {
            switch self {
            case .white:
                return .white
            }
        }
    }

    private lazy var contentView: WCContentView = {
        let view = WCContentView(frame: .zero)
        view.style = .white
        return view
    }()
    
    public var colorStyle: ColorStyle = .white
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        showsVerticalScrollIndicator = false
        bounces = false
        alwaysBounceVertical = false
        backgroundColor = .white
    }
    
    public override func addSubview(_ view: UIView) {
        contentView.addSubview(view)
    }
}

extension WCUIScrollView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        super.addSubview(contentView)
    }
    
    public func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(Constants.minorPriority)
        }
    }
    
    public func configureViews() {
        contentView.style = colorStyle.color
    }
}
