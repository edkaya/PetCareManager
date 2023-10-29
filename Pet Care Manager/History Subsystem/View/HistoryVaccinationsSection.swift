//
//  HistoryVaccinationsSection.swift
//  Pet Care Manager
//
//  Created by user on 14.10.23.
//

import SwiftUI
// MARK: HistoryVaccinationsSection
/// This view is used to display vaccination history of the pet
struct HistoryVaccinationsSection: View {
    var pet: Pet
    var body: some View {
        ForEach(pet.historyRecords, id: \.id) { rec in
            /// if the given history record is a Vaccine
            if let recVaccine = rec as? Vaccine {
                HStack {
                    Text("\(recVaccine.type)")
                    Spacer()
                    Text("dose: \(recVaccine.dose)")
                    Spacer()
                    Text("\(recVaccine.formattedDate)")
                }
            }
        }.onDelete(perform: { indexSet in pet.historyRecords.remove(atOffsets: indexSet)
        })
    }
}

#Preview {
    HistoryVaccinationsSection(pet: Pet(name: "Sude", breed: "Cat", weight: "22"))
}
