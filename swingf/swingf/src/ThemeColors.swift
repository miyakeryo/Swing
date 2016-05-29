//
//  ThemeColors.swift
//  swingf
//
//  Created by Miyake Ryo on 2016/05/18.
//  Copyright © 2016年 Reframe, LLC. All rights reserved.
//

import UIKit

class ThemeColors: NSObject {
    class func paletteName() -> String {
        return "Main Theme"
    }
    
    static let White = UIColor(white:1, alpha:1)
    static var Gray  = UIColor(white:216.0/255.0, alpha:1)
    static var Black = UIColor(white:0, alpha:1)
    
    static var Primary = UIColor(red:255.0/255.0, green:192.0/255.0, blue:88.0/255.0, alpha:1)
    static var Accent  = UIColor(red:0/255.0, green:174.0/255.0, blue:91.0/255.0, alpha:1)
    
}