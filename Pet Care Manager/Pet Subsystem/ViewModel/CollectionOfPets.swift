//
//  CollectionOfPets.swift
//  Pet Care Manager
//
//  Created by user on 11.10.23.
//

import Foundation
import OSLog

// MARK: CollectionOfPets
@Observable class CollectionOfPets {
    var pets: [Pet] = []  /// Pet array to store registered pets
    let logger = Logger() /// Logger to log method/function information
    /// Adding a new registered pet to array
    func addPet(pet: Pet) {
        pets.append(pet)
        logger.log("Pet(\(pet.name)) is added to the CollectionOfPets list.")
    }
    /// Removing a pet from the registered pets
    func removePet(pet: Pet) -> [Pet] {
        /// If pet array is empty or does not contain that pet, do nothing
        if pets.isEmpty || !pets.contains(where: { $0.name == pet.name }) {
            logger.log("Nothing is removed from CollectionOfPets list.")
            return pets
        }
        /// Finding index of the pet which is supposed to be removed
        if let index = pets.firstIndex(of: pet) {
            logger.log("Pet(\(pet.name)) is removed from CollectionOfPets list.")
            pets.remove(at: index)
        }
        return pets
    }
    /// A static function to mock CollectionOfPets for previews
    static func mockPetCollection() -> CollectionOfPets {
        let pets = CollectionOfPets()
        let pet1 = Pet(name: "Sude", breed: "Cat", weight: "100")
        let pet2 = Pet(name: "Ege", breed: "Dog", weight: "200")
        pets.addPet(pet: pet1)
        pets.addPet(pet: pet2)
        return pets
    }
}
