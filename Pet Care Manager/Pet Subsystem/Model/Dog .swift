//
//  Dog .swift
//  Pet Care Manager
//
//  Created by user on 14.10.23.
//

import Foundation
// MARK: Dog
struct Dog: Decodable {
    var fileSizeBytes: Int
    var url: String
    /// Decode json data to Dog object
    static func decodeJSON(from data: Data) throws -> Dog {
        let decoder = JSONDecoder()
        return try decoder.decode(Dog.self, from: data)
    }
}
