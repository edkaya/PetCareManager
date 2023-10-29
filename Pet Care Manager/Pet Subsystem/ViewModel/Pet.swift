//
//  Pet.swift
//  Pet Care Manager
//
//  Created by user on 11.10.23.
//

import Foundation
import OSLog
// MARK: Pet
@Observable class Pet {
    /// Properties
    var name: String
    var breed: String
    var weight: String
    var mealList: [String] = []
    var appointments: [Appointment] = []
    var currentMedications: [Medication] = []
    var historyRecords: [History] = []
    let logger = Logger() /// Logger to log method information
    init(name: String, breed: String, weight: String) {
        self.name = name
        self.breed = breed
        self.weight = weight
    }
    /// Checks if all properties of a pet are not empty
    /// Are created for alerts
    func allPropertiesFilled () -> Bool {
        if name.isEmpty || breed.isEmpty || weight.isEmpty {
            logger.log("All properties of the pet are not filled.")
            return false
        }
        logger.log("All properties of the pet(\(self.name)) are filled.")
        return true
    }
    /// Adding a meal to the mealList of the pet
    func addMealToList(meal: String) {
        logger.log("Meal(\(meal)) is added to the mealList.")
        mealList.append(meal)
    }
    /// Removing a meal from the mealList of the pet
    func removeMealFromList(meal: String) -> [String] {
        if mealList.isEmpty || !mealList.contains(meal) {
            logger.log("Nothing is removed from the mealList.")
            return mealList
        }
        if let index = mealList.firstIndex(of: meal) {
            logger.log("Meal(\(meal)) is removed from the mealList.")
            mealList.remove(at: index)
        }
        return mealList
    }
    /// Adding a medication to the medications of the pet
    func addMedication(med: Medication) {
        logger.log("Medication(\(med.name)) is added to the medications.")
        currentMedications.append(med)
    }
    /// Removing a medication from the medications of the pet
    func removeMedication(med: Medication) -> [Medication] {
        if currentMedications.isEmpty || !currentMedications.contains(med) {
            logger.log("Nothing is removed from the medications.")
            return currentMedications
        }
        if let index = currentMedications.firstIndex(of: med) {
            logger.log("Medication(\(med.name)) is removed from the medications.")
            currentMedications.remove(at: index)
        }
        return currentMedications
    }
    /// Adding an appointment to the appointments of the pet
    func addAppointment(app: Appointment) {
        logger.log("Appointment(\(app.location) & \(app.formattedDate) & \(app.time.formatted(date: .omitted, time: .shortened))) is added to the appointments.")
        appointments.append(app)
    }
    /// Removing an appointment from the appointments of the pet
    func removeAppointment(app: Appointment) -> [Appointment] {
        if appointments.isEmpty || !appointments.contains(app) {
            logger.log("Nothing is removed from the appointments.")
            return appointments
        }
        if let index = appointments.firstIndex(of: app) {
            logger.log("Appointment(\(app.location) & \(app.date.formatted())) is removed from the appointments.")
            appointments.remove(at: index)
        }
        return appointments
    }
    /// Adding a history entity to the historyRecords of the pet
    /// Not to forget: History can be either a Vaccine, an Illness or an Operation
    func addHistoryEntity(ent: History) {
        logger.log("HistoryEntity(\(ent.date)) is added to the history.")
        historyRecords.append(ent)
    }
   /// Static function to fetch the Dog object from a media URL for the API
    static func fetchDogFromMediaURL(from url: URL) async throws -> String {
        let logger_local = Logger()
        let (data, _) = try await URLSession.shared.data(from: url) /// Getting json data from URL
        let dog = try Dog.decodeJSON(from: data) /// Fetching Dog
        logger_local.log("The returned url is: \(dog.url)")
        return dog.url /// As we only need the url, we return the url
    }
}
extension Pet: Equatable {
    static func == (lhs: Pet, rhs: Pet) -> Bool {
        return lhs.name == rhs.name
    }
}
extension Pet: Identifiable {}
