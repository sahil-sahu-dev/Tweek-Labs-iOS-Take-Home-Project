//
//  DrawingConstants.swift
//  TweekLabsHack
//
//  Created by Sahil Sahu on 26/04/22.
//

import Foundation
import SwiftUI

struct DrawingConstants {
    
    static let textFieldGray = Color(red: 240/255, green: 240/255, blue: 240/255)
    
    static let textFieldIconGray = Color(red: 226/255, green: 226/255, blue: 226/255)
    
    static let textFieldOutlineGray = Color(red: 112/255, green: 112/255, blue: 112/255)
    
    static let lightGray = Color(red: 248/255, green: 248/255, blue: 248/255)
    
    static let darkRed = Color(red: 240/255, green: 78/255, blue: 62/255)
    
    static let lightRed = Color(red: 255/255, green: 121/255, blue: 85/255)
    
    static let darkBlack = Color(red: 51/255, green: 51/255, blue: 51/255)
    
    static let lightBlack = Color(red: 43/255, green: 43/255, blue: 43/255)
    
    static let redLinearGradient = LinearGradient(colors: [lightRed, darkRed], startPoint: UnitPoint(x: 0.25, y: 0.5), endPoint:  UnitPoint(x: 0.75, y: 0.5))
}
