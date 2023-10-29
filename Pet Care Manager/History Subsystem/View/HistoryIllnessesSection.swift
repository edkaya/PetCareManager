//
//  HistoryIllnessesSection.swift
//  Pet Care Manager
//
//  Created by user on 14.10.23.
//

import SwiftUI
// MARK: HistoryIllnessesSection
/// This view is used to display illness history of the pet
struct HistoryIllnessesSection: View {
    var pet: Pet
    var body: some View {
        ForEach(pet.historyRecords, id: \.id) { rec in
            /// If the given record is an illness
            if let recIlness = rec as? Ilness {
                HStack {
                    Text("\(recIlness.name)")
                    Spacer()
                    Text("\(recIlness.formattedDate)")
                }
            }
        }.onDelete(perform: { indexSet in pet.historyRecords.remove(atOffsets: indexSet)
        })
    }
}

#Preview {
    HistoryIllnessesSection(pet: Pet(name: "Sude", breed: "Cat", weight: "22"))
}
