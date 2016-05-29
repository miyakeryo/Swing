//
//  Mixin.swift
//  swingf
//
//  Created by Miyake Ryo on 2016/05/17.
//  Copyright © 2016年 Reframe, LLC. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

public func PRINT(items: Any?..., file: String = #file, line: Int = #line)
{
    #if DEBUG
        var items2:[AnyObject] = []
        items2.append("[\((file as NSString).lastPathComponent),\(line)]")
        for item in items {
            items2.append("\(item ?? "(nil)")")
        }
        let log = (items2 as NSArray).componentsJoinedByString(", ")
        print(log)
    #endif
}

extension NSThread {
    
    static func asyncMainThread(block:dispatch_block_t){
        if(currentThread().isMainThread){
            block()
        }else{
            dispatch_async(dispatch_get_main_queue(),block)
        }
    }
    
    static func async(block:dispatch_block_t){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
    }
    
    static func after(block:dispatch_block_t){
        after(block, delay:0)
    }
    static func after(block:dispatch_block_t, delay:NSTimeInterval, queue: dispatch_queue_t? = nil){
        let when = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * NSTimeInterval(NSEC_PER_SEC)))
        dispatch_after(when, queue ?? dispatch_get_main_queue(), block)
    }
}

extension UIView {
    
    func clearAnimations(){
        layer.removeAllAnimations()
    }
    
    func setAlpha(alpha:CGFloat, duration:Double = 0.3){
        if self.alpha != alpha {
            clearAnimations()
            UIView.animateWithDuration(duration, animations: {
                self.alpha = alpha
            })
        }
    }
    
    func setRoundMask(corners:UIRectCorner, radius:CGFloat){
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.CGPath
        maskLayer.masksToBounds = true
        
        layer.mask = maskLayer
    }
}

extension UIImage {
    
    func resize(size2:CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size2, false, 0)
        drawInRect(CGRectMake(0,0,size2.width,size2.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func clip(rect:CGRect) -> UIImage? {
        if rect.isEmpty { return nil }
        
        var drawRect = rect
        drawRect.origin.x *= -1
        drawRect.origin.y *= -1
        drawRect.size = size
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        drawInRect(drawRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func shrink(width:CGFloat) -> UIImage? {
        if size.width <= width {
            return self
        }
        var newSize = CGSizeMake(width, 0)
        newSize.height = size.height * newSize.width / size.width
        return resize(newSize)
    }
    
    func base64String() -> String? {
        if let data = UIImageJPEGRepresentation(self, 0.7) {
            return data.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
        }
        return nil
    }
}

extension String {
    static func DocumentDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
    }
    func uriEncode() -> String {
        return stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())!
    }
}

extension CGRect {
    mutating func scale(ratio:CGFloat){
        origin.x = round(origin.x * ratio)
        origin.y = round(origin.y * ratio)
        size.width = round(size.width * ratio)
        size.height = round(size.height * ratio)
    }
}

extension UIApplication {
    static var isBackGround: Bool{
        return UIApplication.sharedApplication().applicationState == .Background
    }
    static var isActive: Bool{
        return UIApplication.sharedApplication().applicationState == .Active
    }
}

extension CLBeaconRegion {
    func isEqual(uuidString:String, major:UInt16? = nil) -> Bool {
        if proximityUUID.UUIDString == uuidString {
            if let major = major {
                if let selfMajor = self.major{
                    return major == selfMajor.unsignedShortValue
                }
            }else{
                return true
            }
        }
        return false
    }
    
    static var isMonitoringAvailable: Bool{
        return CLLocationManager.isMonitoringAvailableForClass(CLBeaconRegion)
    }
}

extension CLRegion {
    func isBeaconRegion() -> Bool{
        return self is CLBeaconRegion
    }
    func beaconRegion() -> CLBeaconRegion?{
        return self as? CLBeaconRegion
    }
}

extension CLBeacon {
    var majorValue: UInt16 {
        return major.unsignedShortValue
    }
    var minorValue: UInt16 {
        return minor.unsignedShortValue
    }
    var dict:[NSObject:AnyObject]{
        return [
            "major": Int(majorValue),
            "minor": Int(minorValue),
            "rssi": proximity == .Unknown ? -1000 : rssi
        ]
    }
    var key: String {
        return major.stringValue
    }
}
