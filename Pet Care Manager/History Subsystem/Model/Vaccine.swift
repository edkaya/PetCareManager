//
//  Vaccine.swift
//  Pet Care Manager
//
//  Created by user on 11.10.23.
//

import Foundation
// MARK: Vaccine
/// Subclass of History
@Observable class Vaccine: History {
    /// Properties
    var type: String
    var dose: String
    init(type: String, dose: String, date: Date) {
        self.type = type
        self.dose = dose
        super.init(date: date)
    }
}
