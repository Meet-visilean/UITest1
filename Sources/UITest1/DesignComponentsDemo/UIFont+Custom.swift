//
//  UIFont+Custom.swift
//  DesignComponentsDemo
//
//  Created by Dhruvit Kachhiya on 29/05/23.
//

import Foundation
import UIKit

struct AppFontName {
    static let bold = "Inter-Bold"
    static let semiBold = "Inter-SemiBold"
    static let medium = "Inter-Medium"
    static let regular = "Inter-Regular"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    
    @objc class func mySystemFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        switch weight {
        case .medium, .regular:
            return UIFont(name: AppFontName.regular, size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
        case .medium:
            return UIFont(name: AppFontName.medium, size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
        case .semibold:
            return UIFont(name: AppFontName.semiBold, size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
        case .semibold, .bold, .heavy, .black:
            return UIFont(name: AppFontName.bold, size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        default:
            return UIFont(name: AppFontName.regular, size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
        }
    }
    
    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage":
            fontName = AppFontName.regular
        case "CTFontMediumUsage":
            fontName = AppFontName.medium
        case "CTFontSemiboldUsage":
            fontName = AppFontName.semiBold
        case "CTFontEmphasizedUsage", "CTFontBoldUsage", "CTFontHeavyUsage", "CTFontBlackUsage":
            fontName = AppFontName.bold
        default:
            fontName = AppFontName.regular
        }
        
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self else { return }
        
        if let systemFontMethodWithWeight = class_getClassMethod(self, #selector(systemFont(ofSize: weight:))),
            let mySystemFontMethodWithWeight = class_getClassMethod(self, #selector(mySystemFont(ofSize: weight:))) {
            method_exchangeImplementations(systemFontMethodWithWeight, mySystemFontMethodWithWeight)
        }
        
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }
        
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))),
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
    
}
