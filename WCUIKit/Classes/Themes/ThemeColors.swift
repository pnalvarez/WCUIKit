//
//  ThemeColors.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 25/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

public enum ThemeColors {
    case mainRedColor
    case emptyRedColor
    case whiteThemeColor
    case alertGray
    case backgroundGray
    case alertRed
    case attentionYellow
    case normalText
    case black
    case dividerGray
    case connectedGreen
    case disconnectedRed
    case borderGray
    case hexe3e0e0
    case hexe5dfdf
    case c4c4c4
    case hex969494
    case hex707070
    case hexededed
    case hexfdfefe
    
    public var rawValue: UIColor {
        switch self {
        case .mainRedColor:
            return #colorLiteral(red: 0.8980392157, green: 0.04705882353, blue: 0.2352941176, alpha: 1)
        case .emptyRedColor:
            return #colorLiteral(red: 0.8980392157, green: 0.04705882353, blue: 0.2352941176, alpha: 0.6)
        case .whiteThemeColor:
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case .alertGray:
            return #colorLiteral(red: 0.5882352941, green: 0.5803921569, blue: 0.5803921569, alpha: 1)
        case .backgroundGray:
            return #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
        case .alertRed:
            return #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        case .attentionYellow:
            return #colorLiteral(red: 0.9450980392, green: 0.768627451, blue: 0.05882352941, alpha: 1)
        case .normalText:
            return #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
        case .black:
            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        case .dividerGray:
            return #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
        case .connectedGreen:
            return #colorLiteral(red: 0.1764705882, green: 0.5176470588, blue: 0, alpha: 1)
        case .disconnectedRed:
            return #colorLiteral(red: 0.5058823529, green: 0, blue: 0, alpha: 1)
        case .borderGray:
            return #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
        case .hexe3e0e0:
            return #colorLiteral(red: 0.8901960784, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
        case .hexe5dfdf:
            return #colorLiteral(red: 0.8980392157, green: 0.8745098039, blue: 0.8745098039, alpha: 1)
        case .c4c4c4:
            return #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
        case .hex969494:
            return #colorLiteral(red: 0.5882352941, green: 0.5803921569, blue: 0.5803921569, alpha: 1)
        case .hex707070:
            return #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        case .hexededed:
            return #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
        case .hexfdfefe:
            return #colorLiteral(red: 0.9921568627, green: 0.9960784314, blue: 0.9960784314, alpha: 1)
        }
    }
}
