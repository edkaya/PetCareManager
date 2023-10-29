//
//  HistoryView.swift
//  Pet Care Manager
//
//  Created by user on 12.10.23.
//

import SwiftUI
// MARK: HistoryView
/// This view is used to display health records of the pet
struct HistoryView: View {
    var pet: Pet
    var body: some View {
        List {
            Section("Vaccinations") {
                /// Navigate to VaccinationsSection
                HistoryVaccinationsSection(pet: pet)
            }
            Section("Illnesses") {
                /// Navigate to IllnessesSection
                HistoryIllnessesSection(pet: pet)
            }
            Section("Operations") {
                // Navigate to OperationsSection
                HistoryOperationsSection(pet: pet)
            }
        }
    }
}

 #Preview {
     HistoryView(pet: Pet(name: "Sude", breed: "Cat", weight: "120"))
 }
