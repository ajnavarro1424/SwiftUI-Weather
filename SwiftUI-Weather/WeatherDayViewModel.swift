//
//  WeatherDayViewModel.swift
//  SwiftUI-Weather
//
//  Created by Alex Navarro on 12/29/22.
//

import Foundation

struct WeatherDayViewModel {

    enum WeatherType: String {
        case cloudy = "cloud.sun.fill"
        case rain = "cloud.sun.rain.fill"
        case dusting = "sun.dust.fill"
        case drizzle = "cloud.drizzle.fill"
    }

    enum AbbreviatedWeekDays: String {
        case mon = "MON"
        case tues = "TUES"
        case wed = "WED"
        case thurs = "THURS"
        case fri = "FRI"
    }

    var weekday: AbbreviatedWeekDays
    var weatherType: WeatherType
    var temperature: Int = Int.random(in: 0...100)
    
