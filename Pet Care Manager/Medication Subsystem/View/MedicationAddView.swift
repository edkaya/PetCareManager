//
//  MedicationAddView.swift
//  Pet Care Manager
//
//  Created by user on 13.10.23.
//

import SwiftUI
// MARK: MedicationAddView
/// This view is used to display a sheet which enables registering medication
struct MedicationAddView: View {
    @Environment(\.dismiss) var dismiss /// Dismiss variable to dismiss sheet
    @Bindable var pet: Pet
    @State var medication = Medication(name: "", amount: "", howOftenPerDay: "")
    @State var showAlert = false
    var body: some View {
        Form {
            Section("Name") {
                TextField("type here", text: $medication.name)
            }
            Section("Amount") {
                TextField("type here", text: $medication.amount)
            }
            Section("How Often Per Day") {
                TextField("type here", text: $medication.howOftenPerDay)
            }
            Button("Save") {
                /// If all properties are not edited, then alert
                if !medication.allPropertiesFilledMedication() {
                    showAlert.toggle()
                } else {
                    /// otherwise add medication to medications of pet 
                    dismiss()
                    pet.addMedication(med: medication)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("You need to fill out all the options!"),
                      message: Text("Try again"),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    MedicationAddView(pet: Pet(name: "Sude", breed: "Cat", weight: "122"))
}
