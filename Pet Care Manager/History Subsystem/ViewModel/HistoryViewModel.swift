//
//  HistoryViewModel.swift
//  Pet Care Manager
//
//  Created by user on 15.10.23.
//

import Foundation
// MARK: HistoryViewModel
@Observable class HistoryViewModel {
    var pickedRecord: String = "Ilness" /// default/start variable
    var record: History = Ilness(name: "", date: .now) /// empty record
    var showToast = false /// third party package enabling alert
    /// A function to set the selected record into the start variable "pickedRecord"
    func setNewRecord() {
        switch pickedRecord {
        case "Ilness":
            record = Ilness(name: "", date: record.date)
        case "Vaccine":
            record = Vaccine(type: "", dose: "", date: record.date)
        default:
            record = Operation(name: "", date: record.date, operatedBy: "")
        }
    }
    /// A function to save the registered history entity of the pet into the history list of the pet
    func saveRecord(pet: Pet) {
        // Save the record to the pet
        pet.addHistoryEntity(ent: record)
        showToast = true
        pickedRecord = "Ilness"
        record = Ilness(name: "", date: .now)
    }
}
