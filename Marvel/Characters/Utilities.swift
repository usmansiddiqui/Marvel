//
//  Utilities.swift
//  Marvel
//
//  Created by Usman Siddiqui on 2/26/18.
//  Copyright © 2018 Usman_Siddiqui. All rights reserved.
//

import Foundation
import UIKit

enum ImageSize:String {
    case portrait_small,
    portrait_medium,
    portrait_xlarge,
    portrait_fantastic,
    portrait_uncanny,
    portrait_incredible,
    detail
}

enum CharacterDataItems:Int {
    case comics = 0,
    series,
    events,
    stories
    
    var title: String {
        switch self {
        case .comics:
            return "Comics"
        case .series:
            return "Series"
        case .events:
            return "Events"
        case .stories:
            return "Stories"
        }
    }
    
    static let count = 4
}


class Utilities: NSObject {
    
    func getCharacterPortraitImgURL(imgPath: String, imgExtension: String) -> String {
        
        return imgPath + "/\(ImageSize.portrait_uncanny.rawValue)"  + ".\(imgExtension)"
        
    }

}

extension UIColor {
    class func colorWithHexValue(_ hexValue: NSString) -> UIColor {
        return colorWithHexValue(hexValue, alpha: 1.0)
    }
    
    class func colorWithHexValue(_ hexValue: NSString, alpha: CGFloat) -> UIColor {
        
        var c: UInt32 = 0xffffff
        
        if hexValue.hasPrefix("#") {
            Scanner(string: hexValue.substring(from: 1)).scanHexInt32(&c)
        } else {
            Scanner(string: hexValue as String).scanHexInt32(&c)
        }
        
        if hexValue.length > 7 {
            return UIColor(red: CGFloat((c & 0xff000000) >> 24)/255.0, green: CGFloat((c & 0xff0000) >> 16)/255.0, blue: CGFloat((c & 0xff00) >> 8)/255.0, alpha: CGFloat(c & 0xff)/255.0)
        } else {
            return UIColor(red: CGFloat((c & 0xff0000) >> 16)/255.0, green: CGFloat((c & 0xff00) >> 8)/255.0, blue: CGFloat(c & 0xff)/255.0, alpha: alpha)
        }
    }
    
}


