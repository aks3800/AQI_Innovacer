//
//  City+CoreDataProperties.swift
//  AQI_Innovacer
//
//  Created by Akshat Sharma on 01/03/20.
//  Copyright © 2020 aks. All rights reserved.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var cityName: String
    @NSManaged public var isSelected: Bool
    @NSManaged public var aqiIndex: Int16

}
