//
//  Operation.swift
//  Pet Care Manager
//
//  Created by user on 11.10.23.
//

import Foundation
// MARK: Operation
/// Subclass of History
@Observable class Operation: History {
    /// Properties
    var name: String
    var operatedBy: String
    init(name: String, date: Date, operatedBy: String) {
        self.name = name
        self.operatedBy = operatedBy
        super.init(date: date)
    }
}
