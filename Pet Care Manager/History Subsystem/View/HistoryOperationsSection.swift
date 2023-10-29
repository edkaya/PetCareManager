//
//  HistoryOperationsSection.swift
//  Pet Care Manager
//
//  Created by user on 14.10.23.
//

import SwiftUI
// MARK: HistoryOperationsSection
/// This view is used to display operation history of the pet
struct HistoryOperationsSection: View {
    var pet: Pet
    var body: some View {
        ForEach(pet.historyRecords, id: \.id) { rec in
            /// If the given record is an operation
            if let recOperation = rec as? Operation {
                HStack {
                    Text("\(recOperation.name)")
                    Spacer()
                    Text("Operated by \(recOperation.operatedBy)")
                    Spacer()
                    Text("\(recOperation.formattedDate)")
                }
            }
        }.onDelete(perform: { indexSet in pet.historyRecords.remove(atOffsets: indexSet)
        })
    }
}

#Preview {
    HistoryOperationsSection(pet: Pet(name: "Sude", breed: "Cat", weight: "22"))
}
