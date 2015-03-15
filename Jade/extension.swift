//
//  extension.swift
//  Jade
//
//  Created by S-Shimotori on 3/15/15.
//  Copyright (c) 2015 S-Shimotori. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    class func hex(var hexStr:NSString, var alpha:CGFloat)->UIColor{
        hexStr = hexStr.stringByReplacingOccurrencesOfString("#",withString:"")
        let scanner = NSScanner(string:hexStr as String)
        var color:UInt32 = 0
        if scanner.scanHexInt(&color){
            let r = CGFloat((color&0xFF0000)>>16) / 255.0
            let g = CGFloat((color&0x00FF00)>>8) / 255.0
            let b = CGFloat(color&0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.whiteColor();
        }
    }
    
    class func hisuiColor()->UIColor{
        return hex("38b48b",alpha:1)
    }
    class func kawaColor()->UIColor{
        return hex("475950",alpha:1)
    }
    class func tsuyukusaColor()->UIColor{
        return hex("38a1db",alpha:1)
    }
}