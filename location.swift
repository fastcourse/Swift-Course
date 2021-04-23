import UIKit
import GoogleMaps
import Alamofire
import CoreLocation//003
import AVFoundation
import AudioToolbox

import CoreData
import MBProgressHUD

import Darwin
import AudioToolbox //vibration

class Map_Dxxx_Sxxx: UIViewController,GMSMapViewDelegate,CLLocationManagerDelegate, AVAudioPlayerDelegate {
  

override func viewDidDisappear(_ animated: Bool) {
        foreGround = false
    }

override func viewWillDisappear(_ animated: Bool) {
        // onPause() and on Stop()
        foreGround = false
        myTimer.invalidate()
        if myTimer != nil{
            myTimer.invalidate() // stop it
            myTimer = nil
        }
  //stop update of location
  self.locationManager.stopUpdatingLocation()
        self.locationManager.stopMonitoringSignificantLocationChanges()
        self.locationManager.delegate = nil
  
}
    override func viewWillAppear(_ animated: Bool) {
        foreGround = true
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
 
        getMessages()
        if myTimer != nil{
            myTimer.invalidate() // stop it
        }
        print("myTimer called now by viewWillAppear _________________")
        myTimer = Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(getMessages), userInfo: nil, repeats: true)

        
    }
}

    //003
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations in Map_DriverSymbol == \(locValue.latitude) \(locValue.longitude)")
        self.mylat = String(locValue.latitude)
        self.mylon = String(locValue.longitude)
        self.d_lat=mylat
        self.d_lon=mylon
        print("mylat in Map_DriverSymbol", mylat)
        
    }

    //003  this is not very impotant
    func getMyLocation2() {
        //  if(track_me=="1"){
        // For use in foreGround
        if(foreGround){
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        }
    }


// below are more func if you want, but not impotant
func GetDistance4m(x1:String, x2:String, x3:String, x4:String)-> Double {
        var dis_format = "0" //m
        var dis_format_double = 0.0
        
        let coordinate1 = CLLocation(latitude: Double("\(x1)")!, longitude: Double("\(x2)")!)
        let coordinate2 = CLLocation(latitude: Double("\(x3)")!, longitude: Double("\(x4)")!)
        
        var distanceInMeters = coordinate2.distance(from: coordinate1) // result is in meters

        //distanceInMeters = distanceInMeters / 1000  //if you want km
        
        dis_format = "\(String(format: "%.02f", distanceInMeters))"
        //self.label_dis_unit.text="km"
        dis_format_double = Double(dis_format)!
        
       // print("dis :::: ",dis_format )
        //return dis_format // as String
        return dis_format_double
        
    }

    // 004 stop request before send new one
    func StopOldRequests() {
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.cancel() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
            // self.myTimer.invalidate()
            
        }
    }
