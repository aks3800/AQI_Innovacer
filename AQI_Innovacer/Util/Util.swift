//
//  Util.swift
//  AQI_Innovacer
//
//  Created by Akshat Sharma on 01/03/20.
//  Copyright © 2020 aks. All rights reserved.
//

import Foundation

struct Util {
    
    static func isCitiesDataAvailable() -> Bool {
        guard let count = try? PersistanceManager.shared.context.count(for: City.fetchRequest()) else { return false }
        return count > 0 ? true : false
    }
    
    static func saveAllDefaultCities(citiesData: [[String: Any]]) -> Void {
        let persistanceManager = PersistanceManager.shared
        for cityData in citiesData {
            let city = City(context: PersistanceManager.shared.context)
            city.cityName = cityData[Constants.kNAME] as? String ?? ""
            city.isSelected = cityData[Constants.kSELECTED] as? Bool ?? false
            city.aqiIndex = cityData[Constants.kAQI] as? Int16 ?? 0
            persistanceManager.saveContext()
        }
    }
    
    static func getAllCities() -> [City]? {
        guard let cities = try? PersistanceManager.shared.context.fetch(City.fetchRequest()) as? [City] else { return nil }
        return cities
    }
    
    static func getMesurementsURL(forCity city: String) -> String {
        return "\(Constants.mesurementsURL)?city=\(city)&parameter=pm25&limit=1"
    }
    
    static func getPM25Value(fromData data: Data) -> Int? {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return nil }
        if let dict = json as? [String: Any] {
            if let results = dict["results"] as? [[String: Any]] {
                if results.count > 0 {
                    if let mesurements = results[0]["measurements"] as? [[String: Any]] {
                        if mesurements.count > 0 {
                            if let value = mesurements[0]["value"] as? Int {
                                return value
                            }
                        }
                    }
                }
            }
        }
        return nil
    }
    
    static func getCityName(fromData data: Data) -> String? {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return nil }
        if let dict = json as? [String: Any] {
            if let results = dict["results"] as? [[String: Any]] {
                if results.count > 0 {
                    if let cityName = results[0]["city"] as? String {
                        return cityName
                    }
                }
            }
        }
        return nil
    }
    
    static func calculateAQI(pm25 pm25Value: Int) -> Int {
        if pm25Value <= 30 {
            return Int(round(Double(pm25Value) * 50 / 30))
        } else if pm25Value > 30 && pm25Value <= 60 {
            return Int(round(50 + Double(pm25Value - 30) * 50 / 30))
        } else if pm25Value > 60 && pm25Value <= 90 {
            return Int(round(100 + Double(pm25Value - 60) * 100 / 30))
        } else if pm25Value > 90 && pm25Value <= 120 {
            return Int(round(200 + Double(pm25Value - 90) * 100 / 30))
        } else if pm25Value > 120 && pm25Value <= 250 {
            return Int(round(300 + Double(pm25Value - 120) * 100 / 130))
        } else {
            return Int(round(400 + Double(pm25Value - 250) * 100 / 130))
        }
    }
    
}
