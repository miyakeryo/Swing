//
//  DoneViewController.swift
//  swingf
//
//  Created by Miyake Ryo on 2016/05/17.
//  Copyright © 2016年 Reframe, LLC. All rights reserved.
//

import UIKit

class DoneViewController: UIViewController {
    
    @IBOutlet weak var smileImageView: UIImageView!
    @IBOutlet weak var txtImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DoneViewController.didHttpPost(_:)), name: Http.DID_HTTP_POST, object: nil)
        txtImageView.alpha = 0
        smileImageView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 1.0, 0)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        rotate()
    }
    
    var startedAt:Double = 0
    let minInterval:Double = 5.6
    var success = false
    
    func rotate(){
        startedAt = NSDate().timeIntervalSince1970
        smileImageView.layer.zPosition = 1000
        UIView.animateWithDuration(0.7, delay:0, options:[.CurveEaseInOut, .Repeat, .Autoreverse], animations: {
            self.smileImageView.layer.transform = CATransform3DMakeRotation(0, 0, 1.0, 0)
        }){completion in
            self.done()
        }
    }
    
    func didHttpPost(notification:NSNotification){
        if let info = notification.userInfo {
            PRINT("info", info)
            if info["error"] == nil {
                success = true
                stop()
            }else{
                let alert = UIAlertController(title:"", message:"なんかエラーだって", preferredStyle:.Alert)
                alert.addAction(UIAlertAction(title:"とじる", style:.Default, handler:{action in
                    self.smileImageView.clearAnimations()
                }))
                presentViewController(alert, animated:true){}
            }
        }
    }
    
    func stop(){
        let now = NSDate().timeIntervalSince1970
        var delay:Double = 0
        if now < startedAt + minInterval {
            // 早いな
            delay = startedAt + minInterval - now
        }else{
            // 1.4の倍数で止める
            let diff = now - (startedAt + minInterval)
            delay = ((diff * 10) % 14) / 10.0
        }
        NSThread.after({
            self.smileImageView.clearAnimations()
        }, delay:delay)
    }
    
    func done(){
        PRINT("Done")
        txtImageView.setAlpha(success ? 1 : 0)
        NSThread.after({
            self.next()
        }, delay: success ? 3.0 : 0)
    }
    
    func next(){
        PRINT("Next")
        performSegueWithIdentifier("standby", sender:self)
    }
    
    deinit{
        PRINT("deinit DoneViewController")
    }
}