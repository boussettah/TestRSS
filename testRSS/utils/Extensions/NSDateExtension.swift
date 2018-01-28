//
//  NSDateExtension.swift
//  testRSS
//
//  Created by hager boussetta on 26/01/2018.
//  Copyright © 2018 hager boussetta. All rights reserved.
//

import Foundation
extension Date {
    // Get year from date
    func year() -> Int
    {
        return (Calendar.current as NSCalendar).components(NSCalendar.Unit.year, from: self).year!
    }
    
    // Get month from year
    func month() -> Int
    {
        return (Calendar.current as NSCalendar).components(NSCalendar.Unit.month, from: self).month!
    }
    
    // Get day from date
    func day() -> Int
    {
        return (Calendar.current as NSCalendar).components(NSCalendar.Unit.day, from: self).day!
    }
    
    // Get hour from date
    func hour() -> Int
    {
        return (Calendar.current as NSCalendar).components(.hour, from: self).hour!
    }
    
    // Get minute from date
    func minute() -> Int
    {
        return (Calendar.current as NSCalendar).components(.minute, from: self).minute!
    }
    
    // Get seconds from date
    func second() -> Int
    {
        return (Calendar.current as NSCalendar).components(.second, from: self).second!
    }
    
    func formatString(_ dateFormat: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.string(from: self)
    }
}
