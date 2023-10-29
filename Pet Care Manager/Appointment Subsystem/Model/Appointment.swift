//
//  Appointment.swift
//  Pet Care Manager
//
//  Created by user on 11.10.23.
//

import Foundation
// MARK: Appointment
@Observable class Appointment: Equatable {
    static func == (lhs: Appointment, rhs: Appointment) -> Bool {
        return lhs.date == rhs.date && lhs.time == rhs.time && lhs.location == rhs.location
    }
    /// Properties
    var location: String
    var time: Date
    var date: Date
    /// Computed variable to convert a date value to a string and format it to display a proper date text
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        return dateFormatter.string(from: date)
    }
    init(location: String, time: Date, date: Date) {
        self.location = location
        self.time = time
        self.date = date
    }
}
