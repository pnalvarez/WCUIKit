//
//  EmptyListView.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 15/08/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public class WCEmptyListView: UIView {
    
    public enum Layout {
        case smallest
        case small
        case large
        
        public var centralContainerYOffset: CGFloat {
            switch self {
            case .small, .smallest:
                return Constants.smallContainerYOffset
            case .large:
                return Constants.largeContainerYOffset
            }
        }
        
        public var centralContainerHeight: CGFloat {
            switch self {
            case .smallest:
                return Constants.smallestHeight
            case .small:
                return Constants.smallHeight
            case .large:
                return Constants.largeHeight
            }
        }
        
        public var centralContainerWidth: CGFloat {
            switch self {
            case .smallest:
                return Constants.smallestWidth
            case .small:
                return Constants.smallWidth
            case .large:
                return Constants.largeWidth
            }
        }
        
        public var topCircleTrailing: CGFloat {
            switch self {
            case .smallest:
                return Constants.smallestTopCircleTrailing
            case .small:
                return Constants.smallTopCircleTrailing
            case .large:
                return Constants.largeTopCircleTrailing
            }
        }
        
        public var bottomCircleTrailing: CGFloat {
            switch self {
            case .smallest:
                return Constants.smallestBottomCircleTrailing
            case .small:
                return Constants.smallBottomCircleTrailing
            case .large:
                return Constants.largeTopCircleTrailing
            }
        }
        
        public var smallestCircleDimension: CGFloat {
            switch self {
            case .smallest:
                return Constants.smallestSmallestCircleDimension
            case .small:
                return Constants.smallSmallestCircleDimension
            case .large:
                return Constants.largeSmallestCircleDimension
            }
        }
    }
    
    private enum Constants {
        static let smallContainerYOffset: CGFloat = -10
        static let largeContainerYOffset: CGFloat = -40
        static let smallestHeight: CGFloat = 40
        static let smallHeight: CGFloat = 46
        static let largeHeight: CGFloat = 46
        static let smallestWidth: CGFloat = 200
        static let smallWidth: CGFloat = 301
        static let largeWidth: CGFloat = 301
        static let smallestTopCircleTrailing: CGFloat = -11
        static let smallestBottomCircleTrailing: CGFloat = -5
        static let smallTopCircleTrailing: CGFloat = -36
        static let smallBottomCircleTrailing: CGFloat = -30
        static let largeTopCircleTrailing: CGFloat = -36
        static let largeBottomCircleTrailing: CGFloat = -30
        static let smallestSmallestCircleDimension: CGFloat = 10
        static let smallSmallestCircleDimension: CGFloat = 20
        static let largeSmallestCircleDimension: CGFloat = 20
    }
    
    private lazy var centralContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ThemeColors.emptyRedColor.rawValue
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var centralLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = ThemeFonts.RobotoBold(14).rawValue
        view.textColor = ThemeColors.whiteThemeColor.rawValue
        view.textAlignment = .center
        return view
    }()
    
    private lazy var topCircleView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ThemeColors.emptyRedColor.rawValue
        return view
    }()
    
    private lazy var bottomCircleView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ThemeColors.emptyRedColor.rawValue
        return view
    }()
    
    private lazy var smallestCircleView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ThemeColors.emptyRedColor.rawValue
        return view
    }()
    
    private var layout: Layout
    private var text: String
    
    public init(frame: CGRect,
         layout: Layout = .large,
         text: String) {
        self.text = text
        self.layout = layout
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        topCircleView.layer.cornerRadius = topCircleView.frame.height / 2
        topCircleView.clipsToBounds = true
        bottomCircleView.layer.cornerRadius = bottomCircleView.frame.height / 2
        bottomCircleView.clipsToBounds = true
        smallestCircleView.layer.cornerRadius = smallestCircleView.frame.width / 2
        smallestCircleView.clipsToBounds = true
    }
}

extension WCEmptyListView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        centralContainer.addSubview(centralLbl)
        addSubview(centralContainer)
        addSubview(topCircleView)
        addSubview(smallestCircleView)
        addSubview(bottomCircleView)
    }
    
    public func setupConstraints() {
        centralContainer.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(layout.centralContainerYOffset)
            make.centerX.equalToSuperview()
            make.width.equalTo(layout.centralContainerWidth)
            make.height.equalTo(layout.centralContainerHeight)
        }
        centralLbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
        topCircleView.snp.makeConstraints { make in
            make.top.equalTo(centralContainer.snp.bottom).offset(15)
            make.right.equalTo(centralContainer.snp.right).offset(layout.topCircleTrailing)
            make.height.width.equalTo(31)
        }
        smallestCircleView.snp.makeConstraints { make in
            make.top.equalTo(centralContainer.snp.bottom).offset(6)
            make.right.equalTo(centralContainer.snp.right).offset(-30)
            make.height.width.equalTo(layout.smallestCircleDimension)
        }
        bottomCircleView.snp.makeConstraints { make in
            make.top.equalTo(topCircleView.snp.bottom).offset(6)
            make.centerX.equalTo(topCircleView.snp.centerX).offset(16)
            make.height.width.equalTo(20)
        }
    }
    
    public func configureViews() {
        centralLbl.text = text
        topCircleView.isHidden = layout != .large
        bottomCircleView.isHidden = layout != .large
        smallestCircleView.isHidden = layout == .large
    }
}
