//
//  WCProfileHeaderView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 20/05/21.
//

import UIKit

public protocol WCProfileHeaderViewDelegate: AnyObject {
    func didTapRelationInteractionButton(relationState: WCProfileHeaderView.RelationState,
                                         profileHeaderView: WCProfileHeaderView)
}

public class WCProfileHeaderView: UIView {
    
    public enum RelationState {
        case loggedUser
        case connected
        case userSentRequest
        case userReceivedRequest
        case nothing
        
        var image: String {
            switch self {
            case .loggedUser:
                return "ajustar 1"
            case .connected:
                return "icone-conexao-feita 1"
            case .userSentRequest:
                return "icone-check 1"
            case .userReceivedRequest:
                return "icone-pendente 1"
            case .nothing:
                return "fazer-conexao 1"
            }
        }
    }
    
    private enum Constants {
        static let stackSpacing: CGFloat = 2
        static let fontSize: CGFloat = 16
        static let height: CGFloat = 112
    }

    private lazy var profileImageView: WCListItemImageView = {
        let view = WCListItemImageView(frame: .zero)
        return view
    }()
    
    private lazy var profileStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.spacing = Constants.stackSpacing
        view.alignment = .center
        view.axis = .vertical
        view.distribution = .fill
        return view
    }()
    
    private lazy var nameLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.textAlignment = .left
        view.font = ThemeFonts.RobotoBold(Constants.fontSize).rawValue
        view.textColor = ThemeColors.black.rawValue
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var ocupationLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.textAlignment = .left
        view.font = ThemeFonts.RobotoRegular(Constants.fontSize).rawValue
        view.textColor = ThemeColors.black.rawValue
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var emailLbl: WCUILabelRobotoRegularUnderlined = {
        let view = WCUILabelRobotoRegularUnderlined(frame: .zero)
        view.numberOfLines = 0
        view.textAlignment = .left
        return view
    }()
    
    private lazy var phoneNumberLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.textAlignment = .left
        view.font = ThemeFonts.RobotoRegular(Constants.fontSize).rawValue
        view.textColor = ThemeColors.black.rawValue
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var interactionButton: WCSideInteractionButton = {
        let view = WCSideInteractionButton(frame: .zero)
        view.addTarget(self, action: #selector(didTapInteractionButton), for: .touchUpInside)
        return view
    }()
    
    public weak var delegate: WCProfileHeaderViewDelegate?
    
    private var profileImage: String?
    private var name: String?
    private var email: String?
    private var phoneNumber: String?
    private var ocupation: String?
    
    private var relation: RelationState = .nothing {
        didSet {
            interactionButton.setImage(relation.image)
        }
    }
    
    public func setup(profileImage: String,
                      name: String,
                      email: String,
                      phoneNumber: String,
                      ocupation: String,
                      relation: RelationState = .nothing) {
        self.profileImage = profileImage
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.ocupation = ocupation
        self.relation = relation
        applyViewCode()
    }
    
    @objc
    private func didTapInteractionButton() {
        delegate?.didTapRelationInteractionButton(relationState: relation,
                                                  profileHeaderView: self)
    }
}

extension WCProfileHeaderView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(profileImageView)
        profileStackView.addArrangedSubview(nameLbl)
        profileStackView.addArrangedSubview(ocupationLbl)
        profileStackView.addArrangedSubview(emailLbl)
        profileStackView.addArrangedSubview(phoneNumberLbl)
        addSubview(profileStackView)
        addSubview(interactionButton)
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(Constants.height)
        }
        profileImageView.snp.makeConstraints { make in
            make.width.equalTo(84)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(24)
        }
        profileStackView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView)
            make.left.equalTo(profileImageView.snp.right).offset(12)
            make.right.equalTo(interactionButton.snp.left).offset(-12)
        }
        interactionButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView)
            make.right.equalToSuperview().inset(24)
        }
        nameLbl.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
        }
        emailLbl.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
        }
        ocupationLbl.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
        }
        phoneNumberLbl.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
        }
    }
    
    public func configureViews() {
        backgroundColor = .white
        nameLbl.text = name
        ocupationLbl.text = ocupation
        emailLbl.text = email
        phoneNumberLbl.text = phoneNumber
        profileImageView.setImage(withURL: profileImage ?? "")
    }
}
