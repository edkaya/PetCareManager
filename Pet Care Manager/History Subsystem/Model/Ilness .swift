//
//  Ilness .swift
//  Pet Care Manager
//
//  Created by user on 11.10.23.
//

import Foundation
// MARK: Ilness
/// Subclass of History
@Observable class Ilness: History {
    /// Propertie(s)
    var name: String
    init(name: String, date: Date) {
        self.name = name
        super.init(date: date)
    }
}
