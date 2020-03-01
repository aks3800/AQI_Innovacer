//
//  Constants.swift
//  AQI_Innovacer
//
//  Created by Akshat Sharma on 01/03/20.
//  Copyright © 2020 aks. All rights reserved.
//

import Foundation

struct Constants {
    static let kNAME = "name"
    static let kSELECTED = "selected"
    static let kAQI = "AQI"
    static let mesurementsURL = "https://api.openaq.org/v1/latest"
    static let ALL_CITIES_USER_DEFAULTS_KEY = "allCities"
    
    static let allCities: [[String: Any]] = [
        [
            Constants.kNAME: "Bengaluru",
            Constants.kSELECTED: false,
            Constants.kAQI: 0
        ],
        [
            Constants.kNAME: "Chandigarh",
            Constants.kSELECTED: false,
            Constants.kAQI: 0
        ],
        [
            Constants.kNAME: "Chennai",
            Constants.kSELECTED: false,
            Constants.kAQI: 0
        ],
        [
            Constants.kNAME: "Delhi",
            Constants.kSELECTED: false,
            Constants.kAQI: 0
        ],
        [
            Constants.kNAME: "Gurugram",
            Constants.kSELECTED: false,
            Constants.kAQI: 0
        ],
        [
            Constants.kNAME: "Hyderabad",
            Constants.kSELECTED: false,
            Constants.kAQI: 0
        ],
        [
            Constants.kNAME: "Kolkata",
            Constants.kSELECTED: false,
            Constants.kAQI: 0
        ],
        [
            Constants.kNAME: "Noida",
            Constants.kSELECTED: false,
            Constants.kAQI: 0
        ],
        [
            Constants.kNAME: "Pune",
            Constants.kSELECTED: false,
            Constants.kAQI: 0
        ]
    ]
}
