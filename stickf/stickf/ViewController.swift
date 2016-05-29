//
//  ViewController.swift
//  stickf
//
//  Created by Miyake Ryo on 2016/05/19.
//  Copyright © 2016年 Reframe, LLC. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreLocation

class ViewController: UIViewController, CBPeripheralManagerDelegate {
    
    let BEACON_UUID = NSUUID(UUIDString:"B7F7AC5C-7E79-48A0-9CBE-64A34A5DCA41")!
    
    let maneger = CBPeripheralManager(delegate: nil, queue:dispatch_get_main_queue())
    var advertising = false {
        didSet {
            didSetAdvertising()
        }
    }
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var majorText: UILabel!
    @IBOutlet weak var minorText: UILabel!
    
    @IBOutlet weak var majorSlider: UISlider!
    @IBOutlet weak var minorSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        maneger.delegate = self
        onChangeMajor(majorSlider)
        onChangeMinor(minorSlider)
    }

    @IBAction func onBtn(sender: UIButton) {
        advertising = !advertising
    }
    
    @IBAction func onChangeMajor(sender: UISlider) {
        major = UInt16(sender.value)
    }
    
    @IBAction func onChangeMinor(sender: UISlider) {
        minor = UInt16(sender.value)
    }
    
    var major: UInt16 = 1 {
        didSet{
            majorText.text = String(format:"major: %lu", major)
        }
    }
    var minor: UInt16 = 0 {
        didSet{
            minorText.text = String(format:"minor: %lu", minor)
        }
    }
    
    func didSetAdvertising(){
        startButton.setTitle(advertising ? "Stop" : "Start", forState: .Normal)
        
        if advertising {
            indicator.startAnimating()
            if maneger.state == .PoweredOn {
                startAdvertising()
            }else{
                advertising = false
            }
        }else{
            indicator.stopAnimating()
            stopAdvertising()
        }
    }
    
    func startAdvertising(){
        let beaconRegion = CLBeaconRegion(proximityUUID:BEACON_UUID, major:major, minor:minor, identifier:"boo")
        let data = beaconRegion.peripheralDataWithMeasuredPower(nil) as NSDictionary as! [String:AnyObject]
        maneger.startAdvertising(data)
    }
    
    func stopAdvertising(){
        maneger.stopAdvertising()
    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager){
    }

}

