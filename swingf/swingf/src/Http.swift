//
//  Http.swift
//  swingf
//
//  Created by Miyake Ryo on 2016/05/19.
//  Copyright © 2016年 Reframe, LLC. All rights reserved.
//

import Foundation
import UIKit

class Http {
    
    static let API_URL = NSURL(string:"https://script.google.com/macros/s/.../exec")!
    static let DID_HTTP_POST = "DID_HTTP_POST"
    
    static func post(id: Int, param: Int, image: UIImage){
        if let imageBase64 = image.base64String() {
            let str = String(format:"id=%d&param=%d&imageBase64=%@", id, param, imageBase64.uriEncode())
            let data = str.dataUsingEncoding(NSUTF8StringEncoding)!
            post(API_URL, body:data)
        }
    }
    
    static func post(url:NSURL, body:NSData){
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = body
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        request.addValue(String(body.length), forHTTPHeaderField: "Content-Length")
        
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) in
            var userInfo: [NSObject:AnyObject] = [:]
            if let response = response as? NSHTTPURLResponse {
                PRINT("code", response.statusCode)
                userInfo["code"] = response.statusCode
            }
            if let data = data {
                userInfo["body"] = NSString(data:data, encoding:NSUTF8StringEncoding)
            }
            if let error = error {
                PRINT("error", error)
                userInfo["error_code"] = error.code
                userInfo["error_domain"] = error.domain
                userInfo["error"] = error.localizedDescription
            }
            NSNotificationCenter.defaultCenter().postNotificationName(DID_HTTP_POST, object:self, userInfo:userInfo)
        }
    }
    
}