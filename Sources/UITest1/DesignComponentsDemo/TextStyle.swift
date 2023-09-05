//
//  TextStyle.swift
//  DesignComponentsDemo
//
//  Created by Dhruvit Kachhiya on 11/05/23.
//

import Foundation
import UIKit

struct TextStyle {
    
    var font: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    var color: UIColor = .black
    var backgroundColor: UIColor = .white
    
    init(font: UIFont, color: UIColor, backgroundColor: UIColor = .clear) {
        self.font = font
        self.color = color
        self.backgroundColor = backgroundColor
    }
    
}

extension TextStyle {
    
    static let formTitle = TextStyle(font: .formItemTitle, color: .formItemTitle)
    static let formTextField = TextStyle(font: .formItemText, color: .formItemText)
    
    static let primaryButton = TextStyle(font: .primaryButtonTitle, color: .white, backgroundColor: .primary_5)
    static let primaryButtonDisabled = TextStyle(font: .primaryButtonTitle, color: .primary_3, backgroundColor: .neutral_0_5)
    
    static let secondaryButton = TextStyle(font: .secondaryButtonTitle, color: .neutral_7, backgroundColor: .white)
    static let secondaryButtonDisabled = TextStyle(font: .secondaryButtonTitle, color: .neutral_3, backgroundColor: .white)
    
    static let radioButton = TextStyle(font: .radioButton, color: .primary_7, backgroundColor: .white)
    static let checkBox = TextStyle(font: .checkBox, color: .primary_7, backgroundColor: .white)
    
}
