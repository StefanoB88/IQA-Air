//
//  ViewController.swift
//  IQA Air
//
//  Created by Stefano Brandi on 20/07/21.
//

import UIKit
import MapKit
import CoreLocation
import AVKit

class ViewController: UIViewController, MKMapViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var btnHelp: UIButton!
    @IBOutlet weak var btnMapType: UIButton!
    @IBOutlet weak var map1: MKMapView!
    
    let locationManager: CLLocationManager = CLLocationManager()
    
    func displayAlert(message: String) {
        let alert = UIAlertController(title: "Utilizzo dell'app", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            AudioServicesPlaySystemSound(1520)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func longTap(sender: UIGestureRecognizer){
        print("Long Tap")
        if sender.state == .began {
            
            let locationInView = sender.location(in: map1)
            let locationOnMap = map1.convert(locationInView, toCoordinateFrom: map1)
            Datamanager.shared.annotationGlobal.coordinate = locationOnMap
            map1.addAnnotation(Datamanager.shared.annotationGlobal)
            getAddressFromLatLon(Latitude: locationOnMap.latitude, Longitude: locationOnMap.longitude)
            
            
        } else if sender.state == .cancelled {
            map1.removeAnnotation(Datamanager.shared.annotationGlobal)
        }
    }
    
    
    func getAddressFromLatLon(Latitude: Double, Longitude: Double) {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(Latitude)")!
        //21.228124
        let lon: Double = Double("\(Longitude)")!
        //72.833770
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        
        let loc: CLLocation = CLLocation(latitude: center.latitude, longitude: center.longitude)
        
        print(lat)
        print(lon)
        
        ceo.reverseGeocodeLocation(loc, completionHandler:
                                    {(placemarks, error) in
                                        if (error != nil)
                                        {
                                            print("reverse geodcode fail: \(error!.localizedDescription)")
                                        }
                                        let pm = placemarks! as [CLPlacemark]
                                        
                                        if pm.count > 0 {
                                            let pm = placemarks![0]
                                            //print(pm.country ?? "")
                                            //print(pm.locality ?? "")
                                            //print(pm.subLocality ?? "")
                                            //print(pm.thoroughfare ?? "")
                                            //print(pm.postalCode ?? "")
                                            //print(pm.subThoroughfare ?? "")
                                            var addressString : String = ""
                                            
                                            if pm.subLocality != nil {
                                                addressString = addressString + pm.subLocality! + ", "
                                            }
                                            if pm.thoroughfare != nil {
                                                addressString = addressString + pm.thoroughfare! + ", "
                                            }
                                            if pm.locality != nil {
                                                addressString = addressString + pm.locality! + ", "
                                            }
                                            if pm.country != nil {
                                                addressString = addressString + pm.country! + ", "
                                            }
                                            if pm.postalCode != nil {
                                                addressString = addressString + pm.postalCode! + " "
                                            }
                                            
                                            
                                            print(addressString)
                                            
                                            let deleteAlert = UIAlertController(title: addressString, message: "", preferredStyle: UIAlertController.Style.actionSheet)
                                            
                                            let unfollowAction = UIAlertAction(title: "Vai", style: .default) { (action: UIAlertAction) in
                                                
                                                
                                                Datamanager.shared.getIQA(view: self, lat: lat, lon: lon, completion: { _ in
                                                    
                                                    self.performSegue(withIdentifier: "goToDetail", sender: nil)
                                                    
                                                })
                                                
                                                
                                            }
                                            
                                            let cancelAction = UIAlertAction(title: "Cancella", style: .destructive, handler: nil)
                                            
                                            deleteAlert.addAction(unfollowAction)
                                            deleteAlert.addAction(cancelAction)
                                            self.present(deleteAlert, animated: true, completion: nil)
                                            
                                            
                                        }
                                    })
        
    }
    
    
    var mapType = ["Standard", "Hybrid", "Satellite"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mapType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return mapType[row]
        
    }
    
    @IBAction func btnMapType(_ sender: Any) {
        
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 300)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        vc.view.addSubview(pickerView)
        pickerView.delegate = self
        pickerView.dataSource = self
        let editRadiusAlert = UIAlertController(title: "Scegli il tipo di Mappa", message: "", preferredStyle: UIAlertController.Style.alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        editRadiusAlert.addAction(UIAlertAction(title: "Seleziona", style: .default, handler: {_ in
            let test = self.mapType[pickerView.selectedRow(inComponent: 0)]
            
            switch test {
            
            case "Standard":
                self.map1.mapType = MKMapType.standard
                
            case "Hybrid":
                self.map1.mapType = MKMapType.hybrid
                
            case "Satellite":
                self.map1.mapType = MKMapType.satellite
                
            default:
                break
            }
            
        }))
        editRadiusAlert.addAction(UIAlertAction(title: "Cancella", style: .destructive, handler: nil))
        self.present(editRadiusAlert, animated: true)
    }
    
    
    @IBAction func btnHelp(_ sender: Any) {
        AudioServicesPlaySystemSound(1520)
        displayAlert(message: "L'app consente di visualizzare la qualità dell'aria di una certa località, per iniziare basta premere a lungo sulla posizione desiderata della mappa e cliccare successivamente \"Vai\"")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnHelp.layer.borderWidth = 2
        btnHelp.backgroundColor = .systemOrange
        btnHelp.layer.masksToBounds = false
        btnHelp.layer.borderColor = UIColor.black.cgColor
        btnHelp.layer.cornerRadius = btnHelp.frame.height/4
        btnHelp.clipsToBounds = true
        
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
        map1.addGestureRecognizer(longTapGesture)
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        map1.showsUserLocation = true
        map1.mapType = MKMapType.standard
        map1.delegate = self
        
    }
    
    
}

