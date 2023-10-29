//
//  Medication .swift
//  Pet Care Manager
//
//  Created by user on 11.10.23.
//

import Foundation
import OSLog
// MARK: Medication
@Observable class Medication: Equatable {
    static func == (lhs: Medication, rhs: Medication) -> Bool {
        return lhs.name == rhs.name
    }
    /// Properties
    var name: String
    var amount: String
    var howOftenPerDay: String
    /// Logger to log information for function
    let logger = Logger()
    init(name: String, amount: String, howOftenPerDay: String) {
        self.name = name
        self.amount = amount
        self.howOftenPerDay = howOftenPerDay
    }
    /// Function to check if all properties are edited/not empty
    func allPropertiesFilledMedication () -> Bool {
        if name.isEmpty || amount.isEmpty || howOftenPerDay.isEmpty {
            logger.log("All properties of the medication are not filled.")
            return false
        }
        logger.log("All properties of the medication are filled.")
        return true
    }
}
