//
//  ProgressViewController.swift
//  swingf
//
//  Created by Miyake Ryo on 2016/05/17.
//  Copyright © 2016年 Reframe, LLC. All rights reserved.
//

import UIKit
import AVFoundation

class ProgressViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var bar1: UIImageView!
    @IBOutlet weak var bar2: UIImageView!
    @IBOutlet weak var bar3: UIImageView!
    @IBOutlet weak var bar4: UIImageView!
    @IBOutlet weak var bar5: UIImageView!
    
    @IBOutlet weak var howToGoTxtImageView: UIImageView!
    @IBOutlet weak var todayTxtImageView: UIImageView!
    @IBOutlet weak var gohomeTxtImageView: UIImageView!
    
    @IBOutlet weak var busImageView: UIImageView!
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var walkImageView: UIImageView!
    
    @IBOutlet weak var ellipseImageView: UIImageView!
    
    var session: AVCaptureSession!
    var camera: AVCaptureDevice!
    var input: AVCaptureDeviceInput!
    var output: AVCaptureStillImageOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    var howToGo:HowToGo = .Bus
    
    var count: Int = 0 {
        didSet{
            reloadBars()
        }
    }
    var countDownTimer:NSTimer?
    
    var finished = false
    var photo: UIImage? = nil
    var id: Int = 1
    
    func setBeacon(beacon:[String:AnyObject]?){
        guard let beacon = beacon,
            major = beacon["major"]?.integerValue,
            minor = beacon["minor"]?.integerValue else {
                return
        }
        BeaconManager.manager.clear()
        id = minor
        howToGo = HowToGo(rawValue: major) ?? .Bus
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraInit()
        
        howToGoTxtImageView.alpha = 0
        todayTxtImageView.alpha = 0
        gohomeTxtImageView.alpha = 0
        busImageView.alpha = 0
        carImageView.alpha = 0
        walkImageView.alpha = 0
        
        let anchorPoint = CGPoint(x:0.5, y:0.85)
        busImageView.layer.anchorPoint = anchorPoint
        carImageView.layer.anchorPoint = anchorPoint
        walkImageView.layer.anchorPoint = anchorPoint
        
        countDownTimer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector:#selector(ProgressViewController.countUp), userInfo:nil, repeats:true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if finished {return}
        
        setHowToGo(howToGo, duration:0.5)
        
        busImageView.transform = CGAffineTransformMakeScale(0.65, 0.65)
        carImageView.transform = CGAffineTransformMakeScale(0.65, 0.65)
        walkImageView.transform = CGAffineTransformMakeScale(0.65, 0.65)

        howToGoTxtImageView.setAlpha(1, duration:0.5)
        todayTxtImageView.setAlpha(1, duration:0.5)
        gohomeTxtImageView.setAlpha(1, duration:0.5)
        
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        session.stopRunning()
        if finished {
            contentView.hidden = true
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if finished {return}
        session.startRunning()
    }
    
    override func updateViewConstraints(){
        super.updateViewConstraints()
        NSThread.after(){
            self.didUpdateViewConstraints()
        }
    }
    
    func didUpdateViewConstraints(){
        if finished {return}
        ellipseImageView.setRoundMask(.AllCorners, radius: ellipseImageView.bounds.width / 2.0)
        previewLayer.frame = ellipseImageView.bounds
        previewLayer.removeAllAnimations()
    }
    
    func cameraInit(){
        session = AVCaptureSession()
        
        for device in (AVCaptureDevice.devices() as? [AVCaptureDevice])! where device.position == .Front {
            camera = device
            break
        }
        
        do {
            input = try AVCaptureDeviceInput(device: camera)
        } catch let error {
            PRINT(error)
            return
        }
        
        if session.canAddInput(input) {
            session.addInput(input)
        }
        
        output = AVCaptureStillImageOutput()
        if session.canAddOutput(output) {
            session.addOutput(output)
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = ellipseImageView.bounds
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        ellipseImageView.layer.addSublayer(previewLayer)
    }

    @IBAction func onBus(sender: AnyObject) {
        setHowToGo(.Bus)
    }

    @IBAction func onCar(sender: AnyObject) {
        setHowToGo(.Car)
    }
    
    @IBAction func onWalk(sender: AnyObject) {
        setHowToGo(.Walk)
    }
    
    func setHowToGo(howToGo:HowToGo, duration:Double = 0.3){
        switch (howToGo) {
        case .Bus:
            imageBtnActivate(busImageView, duration:duration)
            imageBtnDeactivate(carImageView, duration:duration)
            imageBtnDeactivate(walkImageView, duration:duration)
            howToGoTxtImageView.image = UIImage(named: "progress_txt_bus")
        case .Car:
            imageBtnDeactivate(busImageView, duration:duration)
            imageBtnActivate(carImageView, duration:duration)
            imageBtnDeactivate(walkImageView, duration:duration)
            howToGoTxtImageView.image = UIImage(named: "progress_txt_car")
        case .Walk:
            imageBtnDeactivate(busImageView, duration:duration)
            imageBtnDeactivate(carImageView, duration:duration)
            imageBtnActivate(walkImageView, duration:duration)
            howToGoTxtImageView.image = UIImage(named: "progress_txt_walk")
        }
        self.howToGo = howToGo
    }
    
    func imageBtnActivate(btn:UIImageView, duration:Double = 0.3){
        btn.clearAnimations()
        UIView.animateWithDuration(duration, delay:0, options:.CurveEaseOut, animations: {
            btn.transform = CGAffineTransformIdentity
            btn.alpha = 1
        }){completion in }
    }
    func imageBtnDeactivate(btn:UIImageView, duration:Double = 0.3){
        btn.clearAnimations()
        UIView.animateWithDuration(duration, delay:0, options:.CurveEaseOut, animations: {
            btn.transform = CGAffineTransformMakeScale(0.65, 0.65)
            btn.alpha = 0.5
        }){completion in }
    }
    
    func countUp(){
        count += 1
        if 5 < count {
            countDownTimer?.invalidate()
            countDownTimer = nil
            shoot()
        }
    }
    func reloadBars(){
        bar1.hidden = count < 1
        bar2.hidden = count < 2
        bar3.hidden = count < 3
        bar4.hidden = count < 4
        bar5.hidden = count < 5
    }
    
    func shoot(){
        finished = true
        if let connection = output.connectionWithMediaType(AVMediaTypeVideo) {
            switch UIApplication.sharedApplication().statusBarOrientation {
            case .Portrait:
                connection.videoOrientation = .Portrait
            case .PortraitUpsideDown:
                connection.videoOrientation = .PortraitUpsideDown
            case .LandscapeLeft:
                connection.videoOrientation = .LandscapeLeft
            case .LandscapeRight:
                connection.videoOrientation = .LandscapeRight
            default:
                break
            }
            output.captureStillImageAsynchronouslyFromConnection(connection){ (imageDataBuffer, error) in
                PRINT("error", error)
                let data = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataBuffer)
                self.setPhotoImage(UIImage(data:data)!)
            }
        }
        session.stopRunning()
        
        NSThread.after({
            self.done()
        }, delay: 2)
    }
    
    func setPhotoImage(image:UIImage){
        let ratio = image.size.height / view.frame.height
        var frame = ellipseImageView.frame
        frame.scale(ratio)
        // width:300pxにする
        let scale = UIScreen.mainScreen().scale
        photo = image.shrink(300.0/scale)
    }
    
    func done(){
        PRINT("Done")
        performSegueWithIdentifier("done", sender:self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if photo == nil {
            photo = UIImage(named:"smile")
        }
        Http.post(id, param:howToGo.rawValue, image:photo!)
    }
    
    deinit{
        for output in session.outputs {
            session.removeOutput(output as? AVCaptureOutput)
        }
        for input in session.inputs {
            session.removeInput(input as? AVCaptureInput)
        }
        PRINT("deinit ProgressViewController")
    }
}

