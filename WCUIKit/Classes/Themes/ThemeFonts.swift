//
//  ThemeFonts.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 15/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

public enum ThemeFonts {
    
    case RobotoLight(CGFloat)
    case RobotoCondensedLight(CGFloat)
    case RobotoCondensedBold(CGFloat)
    case RobotoBlackItalic(CGFloat)
    case RobotoCondensedRegular(CGFloat)
    case RobotoCondensedBoldItalic(CGFloat)
    case RobotoThin(CGFloat)
    case RobotoCondensedItalic(CGFloat)
    case RobotoCondensedLightItalic(CGFloat)
    case RobotoBoldItalic(CGFloat)
    case RobotoBold(CGFloat)
    case RobotoThinItalic(CGFloat)
    case RobotoLightItalic(CGFloat)
    case RobotoMedium(CGFloat)
    case RobotoItalic(CGFloat)
    case RobotoBlack(CGFloat)
    case RobotoRegular(CGFloat)
    case RobotoMediumItalic(CGFloat)
    
    public var rawValue: UIFont {
        switch self {
        case .RobotoLight(let size):
            return UIFont(name: "Roboto-Light", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoCondensedLight(let size):
            return UIFont(name: "RobotoCondensed-Light", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoCondensedBold(let size):
            return UIFont(name: "RobotoCondensed-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoBlackItalic(let size):
            return UIFont(name: "Roboto-BlackItalic", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoCondensedRegular(let size):
            return UIFont(name: "RobotoCondensed-Regular", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoCondensedBoldItalic(let size):
            return UIFont(name: "RobotoCondensed-BoldItalic", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoThin(let size):
            return UIFont(name: "Roboto-Thin", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoCondensedItalic(let size):
            return UIFont(name: "RobotoCondensed-Italic", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoCondensedLightItalic(let size):
            return UIFont(name: "RobotoCondensed-LightItalic", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoBoldItalic(let size):
            return UIFont(name: "Roboto-BoldItalic", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoBold(let size):
            return UIFont(name: "Roboto-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoThinItalic(let size):
            return UIFont(name: "Roboto-ThinItalic", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoLightItalic(let size):
            return UIFont(name: "Roboto-LightItalic", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoMedium(let size):
            return UIFont(name: "Roboto-Medium", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoItalic(let size):
            return UIFont(name: "Roboto-Italic", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoBlack(let size):
            return UIFont(name: "Roboto-Black", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoRegular(let size):
            return UIFont(name: "Roboto-Regular", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .RobotoMediumItalic(let size):
            return UIFont(name: "Roboto-MediumItalic", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        }
    }
}

