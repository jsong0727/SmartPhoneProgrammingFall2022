//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Jiayin Song on 11/19/22.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    
    let locationManager = CLLocationManager()
    var temps = [String]()
    @IBOutlet weak var txtCityState: UITextField!
    
    @IBOutlet weak var tblView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        
        print(lat)
        print(lng)
        
        getAddressFromLocation(location: location)
    }
    
    
    @IBAction func getLocation(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func getAddressFromLocation( location: CLLocation) {
        let clGeoCoder = CLGeocoder()
        clGeoCoder.reverseGeocodeLocation(location) { placeMarks, error in
            
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            var address = ""
            guard let place = placeMarks?.first else { return }
            
            
            if place.locality != nil {
                address += place.locality! + ", "
            }
            
            if place.administrativeArea != nil {
                address += place.administrativeArea! + ", "
            }
            
            if place.postalCode != nil {
                address += place.postalCode! + ", "
            }
            
            if place.country != nil {
                address += place.country! + ", "
            }
            
            print(address)
        }
    }
    
    
    @IBAction func getWeatherInfo(_ sender: Any) {
    
        var url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations="
        url += txtCityState.text!
        url += "&aggregateHours=24&unitGroup=us&shortColumnNames=false&contentType=json&key=AYQR6QM5KHFYVPH9M4EXXJUCC"


        SwiftSpinner.show("Getting Weather Forecast")
        
        AF.request(url).responseJSON { responseData in
            //print(responseData)
            
            SwiftSpinner.hide()
            
            if responseData.error != nil {
                print(responseData.error!)
                return
            }
            
            let weatherData = JSON(responseData.data as Any)
            let forecastValues = weatherData["locations"][self.txtCityState.text!]["values"]
            print(forecastValues.count)
            self.temps = [String]()
            for forecast in forecastValues {
                print(forecast)
                
                let forcastJSON = JSON(forecast.1)
                let temp = forcastJSON["temp"].floatValue
                let condition = forcastJSON["conditions"].stringValue
                let str = "Temperature = \(temp)'|, \(condition)"
                self.temps.append(str)
            }
            self.tblView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = temps[indexPath.row]
        return cell
    }
//    func tblVeiw(_ tblView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tblView(_ tblView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
    
    
}

