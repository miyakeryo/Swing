//
//  BeaconManager.swift
//  swingf
//
//  Created by Miyake Ryo on 2016/05/19.
//  Copyright © 2016年 Reframe, LLC. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

@objc(BeaconManager) public class BeaconManager:NSObject, CLLocationManagerDelegate {
    
    static let DID_RANGE_BEACONS = "DID_RANGE_BEACONS"
    public static let BEACON_ID = "SwingBeacon"
    public static let BEACON_UUID = NSUUID(UUIDString:"B7F7AC5C-7E79-48A0-9CBE-64A34A5DCA41")!
    
    let locationManager = CLLocationManager()
    
    private var started = false
    
    private var beaconRegion:CLBeaconRegion?
    private var isRanging = false
    
    private var receivedBeacons:[String:AnyObject] = [:]
    
    static let manager = BeaconManager()
    override private init(){
        super.init()
        locationManager.delegate = self
        createBeaconRegion(BeaconManager.BEACON_UUID)
    }
    
    func requestAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        case .AuthorizedAlways: fallthrough
        case .AuthorizedWhenInUse:
            break
        case .NotDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            if let url = NSURL(string:UIApplicationOpenSettingsURLString) {
                UIApplication.sharedApplication().openURL(url)
            }
        }
    }
    
    // MARK - Beacon
    
    public func createBeaconRegion(uuid:NSUUID, major:UInt16? = nil){
        let region:CLBeaconRegion
        if let major = major {
            region = CLBeaconRegion(proximityUUID: uuid, major:major, identifier:BeaconManager.BEACON_ID)
        }else{
            region = CLBeaconRegion(proximityUUID: uuid, identifier:BeaconManager.BEACON_ID)
        }
        beaconRegion = region
    }
    
    public func startBeaconRanging(){
        started = true
        clear()
        switch CLLocationManager.authorizationStatus() {
        case .AuthorizedAlways: fallthrough
        case .AuthorizedWhenInUse:
            _startBeaconRanging()
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    func _startBeaconRanging(){
        if let beaconRegion = beaconRegion where started && CLBeaconRegion.isMonitoringAvailable && !isRanging {
            isRanging = true
            locationManager.startRangingBeaconsInRegion(beaconRegion)
        }
    }
    
    public func stopBeaconRanging(){
        started = false
        if let beaconRegion = beaconRegion where isRanging {
            isRanging = false
            locationManager.stopRangingBeaconsInRegion(beaconRegion)
        }
    }
    
    // MARK: - CLLocationManagerDelegate
    
    public func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus){
        switch status {
        case .AuthorizedAlways: fallthrough
        case .AuthorizedWhenInUse:
            if UIApplication.isActive {
                _startBeaconRanging()
            }
        default:
            break
        }
    }
    
    public func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion){
        for beacon in beacons {
            receivedBeacons[beacon.key] = beacon.dict
        }
        NSNotificationCenter.defaultCenter().postNotificationName(BeaconManager.DID_RANGE_BEACONS, object:self, userInfo:nil)
    }
    
    public func locationManager(manager: CLLocationManager, rangingBeaconsDidFailForRegion region: CLBeaconRegion, withError error: NSError){
        PRINT(error)
        isRanging = false
    }
    
    
    //
    
    public func getReceivedBeacons() -> [[String:AnyObject]]{
        var results:[[String:AnyObject]] = []
        for (_,val) in receivedBeacons {
            results.append(val as! [String : AnyObject])
        }
        return results.sort(){ $0["rssi"]?.integerValue < $1["rssi"]?.integerValue }
    }
    
    public func clear(){
        receivedBeacons.removeAll()
    }
}
