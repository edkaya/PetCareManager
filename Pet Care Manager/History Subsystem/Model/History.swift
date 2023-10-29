//
//  History.swift
//  Pet Care Manager
//
//  Created by user on 11.10.23.
//

import Foundation
// MARK: History
@Observable class History: Identifiable {
    /// Propertie(s)
    var date: Date
    var id = UUID()
    /// Computed variable to format the date and convert the date to a string to display it on View
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        return dateFormatter.string(from: date)
    }
    init(date: Date) {
        self.date = date
    }
}
