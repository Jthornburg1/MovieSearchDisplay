//
//  Date+Extensions.swift
//  MovieBrowser
//
//  Created by jonathan thornburg on 3/14/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

extension Date {
    
    static func spelledMonthString(from dateString: String) -> String {
        // extract the month integer
        let componentsArray = dateString.split(separator: "-")
        guard componentsArray.count == 3, let monthInt = Int(componentsArray[1]) else { return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD"
        guard let date = formatter.date(from: dateString) else {
            return "failedDate"
        }
        formatter.dateFormat = "DD, YYYY"
        let dayYear = formatter.string(from: date)
        return formatter.monthSymbols[monthInt - 1] + " \(dayYear)"
    }
    
    static func slashString(from dateString: String) -> String {
        var componentsArray = dateString.split(separator: "-")
        componentsArray[0] = componentsArray[0].suffix(2)
        return [componentsArray[1], componentsArray[2], componentsArray[0]].joined(separator: "/")
    }
    
}
