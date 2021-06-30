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
    func didTapEditProfile(profileHeaderView: WCProfileHeaderView)
    func didTapInviteToProjects(profileHeaderView: WCProfileHeaderView)
    func didTapConnections(profileHeaderView: WCProfileHeaderView)
}

public class WCProfileHeaderView: WCUIView {
    
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
        
        var inviteToProjectsButtonVisible: Bool {
            switch self {
            case .loggedUser:
                return false
            default:
                return true
            }
        }
        
        var editProfileButtonVisible: Bool {
            switch self {
            case .loggedUser:
                return true
            default:
                return false
            }
        }
    }
    
    private enum Strings {
        static let inviteToProjects = "Convidar para projetos"
        static let connectionsButtonText = "%@ conexões"
        static let editProfile = "Editar perfil"
    }
    
    private enum Constants {
        static let infoStackSpacing: CGFloat = 2
        static let buttonStackSpacing: CGFloat = 12
        static let fontSize: CGFloat = 16
        static let height: CGFloat = 112
    }

    private lazy var profileImageView: WCListItemImageView = {
        let view = WCListItemImageView(frame: .zero)
        return view
    }()
    
    private lazy var profileStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.spacing = Constants.infoStackSpacing
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
    
    private lazy var emailLbl: WCUILabelRobotoRegular16UnderlinedBlack = {
        let view = WCUILabelRobotoRegular16UnderlinedBlack(frame: .zero)
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
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fill
        view.spacing = Constants.buttonStackSpacing
        return view
    }()
    
    private lazy var interactionButton: WCSideInteractionButton = {
        let view = WCSideInteractionButton(frame: .zero)
        view.addTarget(self, action: #selector(didTapInteractionButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var editProfileButton: WCTertiaryButton = {
        let view = WCTertiaryButton(frame: .zero)
        view.text = Strings.editProfile
        view.addTarget(self, action: #selector(didTapEditProfile), for: .touchUpInside)
        return view
    }()
    
    private lazy var inviteToProjectsButton: WCSecondaryButton = {
        let view = WCSecondaryButton(frame: .zero)
        view.text = Strings.inviteToProjects
        view.addTarget(self, action: #selector(didTapInviteToProjects), for: .touchUpInside)
        return view
    }()
    
    private lazy var connectionsButton: WCPrimaryActionButton = {
        let view = WCPrimaryActionButton(frame: .zero)
        view.addTarget(self, action: #selector(didTapConnectionsButton), for: .touchUpInside)
        return view
    }()
    
    public weak var delegate: WCProfileHeaderViewDelegate?
    
    private var profileImage: String?
    private var name: String?
    private var email: String?
    private var phoneNumber: String?
    private var ocupation: String?
    private var connectionsNumber: Int?
    
    private var relation: RelationState = .nothing {
        didSet {
            interactionButton.setImage(relation.image)
        }
    }
    
    public func setup(profileImage: String? = nil,
                      name: String? = nil,
                      email: String? = nil,
                      phoneNumber: String? = nil,
                      ocupation: String? = nil,
                      connectionsNumber: Int = 0,
                      relation: RelationState = .nothing) {
        self.profileImage = profileImage
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.ocupation = ocupation
        self.relation = relation
        self.connectionsNumber = connectionsNumber
        applyViewCode()
    }
    
    @objc
    private func didTapInteractionButton() {
        delegate?.didTapRelationInteractionButton(relationState: relation,
                                                  profileHeaderView: self)
    }
    
    @objc
    private func didTapInviteToProjects() {
        delegate?.didTapInviteToProjects(profileHeaderView: self)
    }
    
    @objc
    private func didTapConnectionsButton() {
        delegate?.didTapConnections(profileHeaderView: self)
    }
    
    @objc
    private func didTapEditProfile() {
        delegate?.didTapEditProfile(profileHeaderView: self)
    }
    
    private func setupVisibility() {
        inviteToProjectsButton.isHidden = !relation.inviteToProjectsButtonVisible
        editProfileButton.isHidden = !relation.editProfileButtonVisible
    }
}

extension WCProfileHeaderView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        addSubview(profileImageView)
        profileStackView.addArrangedSubview(nameLbl)
        profileStackView.addArrangedSubview(ocupationLbl)
        profileStackView.addArrangedSubview(emailLbl)
        profileStackView.addArrangedSubview(phoneNumberLbl)
        buttonStackView.addArrangedSubview(inviteToProjectsButton)
        buttonStackView.addArrangedSubview(editProfileButton)
        buttonStackView.addArrangedSubview(connectionsButton)
        addSubview(profileStackView)
        addSubview(buttonStackView)
        addSubview(interactionButton)
    }
    
    public func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.width.equalTo(84)
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
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(profileStackView.snp.bottom).offset(26)
            make.left.right.bottom.equalToSuperview()
        }
        inviteToProjectsButton.snp.makeConstraints { make in
            make.width.equalTo(171)
        }
        editProfileButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(32)
        }
        connectionsButton.snp.makeConstraints { make in
            make.width.equalTo(171)
        }
    }
    
    public func configureViews() {
        backgroundColor = .white

        if let name = name {
            nameLbl.text = name
        }
        if let ocupation = ocupation {
            ocupationLbl.text = ocupation
        }
        if let email = email {
            emailLbl.text = email
        }
        if let phoneNumber = phoneNumber {
            phoneNumberLbl.text = phoneNumber
        }
        if let profileImage = profileImage {
            profileImageView.setImage(withURL: profileImage)
        }
        if let connectionsNumber = connectionsNumber {
            connectionsButton.text = String(format: Strings.connectionsButtonText, "\(connectionsNumber)")
        }
        setupVisibility()
    }
}
