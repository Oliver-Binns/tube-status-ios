//
//  LineStatusUpdate+SwiftUI.swift
//  TFLStatus
//
//  Created by Oliver Binns on 24/06/2020.
//

import SwiftUI

extension Line {
    var color: Color {
        switch self {
        case .bakerloo:
            return Color(#colorLiteral(red: 0.6980392157, green: 0.3882352941, blue: 0, alpha: 1))
        case .central:
            return Color(#colorLiteral(red: 0.862745098, green: 0.1411764706, blue: 0.1215686275, alpha: 1))
        case .circle:
            return Color(#colorLiteral(red: 1, green: 0.8274509804, blue: 0.1607843137, alpha: 1))
        case .district:
            return Color(#colorLiteral(red: 0, green: 0.4901960784, blue: 0.1960784314, alpha: 1))
        case .hammersmith:
            return Color(#colorLiteral(red: 0.9568627451, green: 0.662745098, blue: 0.7450980392, alpha: 1))
        case .jubilee:
            return Color(#colorLiteral(red: 0.631372549, green: 0.6470588235, blue: 0.6549019608, alpha: 1))
        case .metropolitan:
            return Color(#colorLiteral(red: 0.6078431373, green: 0, blue: 0.3450980392, alpha: 1))
        case .northern:
            return Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        case .piccadilly:
            return Color(#colorLiteral(red: 0, green: 0.09803921569, blue: 0.6588235294, alpha: 1))
        case .victoria:
            return Color(#colorLiteral(red: 0, green: 0.5960784314, blue: 0.8470588235, alpha: 1))
        case .waterloo:
            return Color(#colorLiteral(red: 0.5764705882, green: 0.8078431373, blue: 0.7294117647, alpha: 1))
        }
    }
}
