//
//  StandbyViewController.swift
//  swingf
//
//  Created by Miyake Ryo on 2016/05/17.
//  Copyright © 2016年 Reframe, LLC. All rights reserved.
//

import UIKit

class StandbyViewController: UIViewController {
    
    @IBOutlet weak var loadImageView: UIImageView!
    @IBOutlet weak var smileImageView: UIImageView!
    @IBOutlet weak var txtImageView: UIImageView!
    @IBOutlet weak var helpButton: UIButton!
    
    private var beacon:[String:AnyObject]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var images:[UIImage] = []
        
        for i in 1...104 {
            images.append(UIImage(named: String(format:"standby_loading/standby_loading_%03d", i))!)
        }
        loadImageView.animationImages = images
        
        txtImageView.alpha = 0
        helpButton.alpha = 0
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(StandbyViewController.didRangeBeacons(_:)),
                                                         name: BeaconManager.DID_RANGE_BEACONS, object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadImageView.startAnimating()
        txtImageView.setAlpha(1)
        helpButton.setAlpha(1)
        BeaconManager.manager.startBeaconRanging()
    }
    override func viewDidDisappear(animated: Bool) {
        BeaconManager.manager.stopBeaconRanging()
        loadImageView.stopAnimating()
        txtImageView.alpha = 0
        helpButton.alpha = 0
        super.viewDidDisappear(animated)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        PRINT(String.DocumentDirectory())
//        let dirURL = NSURL.fileURLWithPath(String.DocumentDirectory())
//        let image1 = UIImage(named: "knife")!
//        PRINT("image1.size", image1.size)
//        let data1 = UIImageJPEGRepresentation(image1, 0.7)!
//        data1.writeToURL(dirURL.URLByAppendingPathComponent("knife.jpg"), atomically: true)
//
//        let scale = UIScreen.mainScreen().scale
//        PRINT("scale", scale)
//        
//        let image2 = image1.shrink(300.0/scale)!
//        PRINT("image2.size", image2.size)
//        let data2 = UIImageJPEGRepresentation(image2, 0.7)!
//        data2.writeToURL(dirURL.URLByAppendingPathComponent("knife_2.jpg"), atomically: true)
//
    }
    
    @IBAction func unwindToStandbySegue(segue: UIStoryboardSegue) {
    }
    
    @IBAction func onHelp(sender: AnyObject) {
        let alert = UIAlertController(title:"", message:"例のぼうをふってね", preferredStyle:.Alert)
        alert.addAction(UIAlertAction(title:"とじる", style:.Default, handler:{action in
            //
        }))
        presentViewController(alert, animated:true){}
    }
    
    @IBAction func onSwing(sender: AnyObject) {
        didSwing()
    }
    
    func didRangeBeacons(notification:NSNotification){
        if beacon != nil { return }
        if let beacon = BeaconManager.manager.getReceivedBeacons().first {
            guard let major = beacon["major"]?.integerValue where beacon["rssi"]?.integerValue > -100 else { return }
            if 0 < major {
                BeaconManager.manager.stopBeaconRanging()
                self.beacon = beacon
                didSwing()
            }
        }
    }
    
    func didSwing(){
        smileImageView.layer.zPosition = 1000
        UIView.animateWithDuration(0.7, delay:0, options:.CurveEaseInOut, animations: {
            self.smileImageView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 1.0, 0)
        }){completion in
            UIView.animateWithDuration(0.7, delay:0, options:.CurveEaseInOut, animations: {
                self.smileImageView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI*2), 0, 1.0, 0)
            }){completion in
                self.goProgress()
            }
        }
    }
    
    func goProgress(){
        PRINT("Progress")
        performSegueWithIdentifier("progress", sender:self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? ProgressViewController {
            vc.setBeacon(beacon)
            beacon = nil
        }
    }
    
}