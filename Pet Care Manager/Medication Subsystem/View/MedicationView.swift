//
//  MedicationView.swift
//  Pet Care Manager
//
//  Created by user on 13.10.23.
//

import SwiftUI
// MARK: MedicationView
/// This view is used to display the medications of the pet as a list
struct MedicationView: View {
    var pet: Pet
    @State var showingSheet = false
    var body: some View {
        List {
            Section {
                /// Dynamic listing to access all elements of medications
                ForEach(pet.currentMedications, id: \.name) { med in
                    HStack {
                        Text("\(med.name)")
                        Spacer()
                        Text("\(med.amount) pills")
                        Spacer()
                        Text("\(med.howOftenPerDay) times")
                    }
                }.onDelete(perform: { indexSet in /// Adding delete option
                    pet.currentMedications.remove(atOffsets: indexSet)
                })
            }
            Section {
                Button("Add Medication") {
                    showingSheet.toggle()
                }.padding(2)
                 .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                /// If Add Medication Button is clicked, then display MedicationAddView
                 .sheet(isPresented: $showingSheet) {
                     MedicationAddView(pet: pet)
                 }
            }
        }.navigationTitle("Medications")
            .bold()
    }
}

#Preview {
    MedicationView(pet: Pet(name: "sude", breed: "cat", weight: "122"))
}
