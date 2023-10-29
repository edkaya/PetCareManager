//
//  FeatureView .swift
//  Pet Care Manager
//
//  Created by user on 13.10.23.
//

import SwiftUI
// MARK: FeatureView
/// This view enables user to edit pets features
struct FeatureView: View {
    @Environment(\.dismiss) var dismiss /// dismiss variable to dismiss sheet
    @Bindable var pet: Pet
    @State var showAlert = false
    var body: some View {
        Form {
            Section("Name") {
                TextField("\(pet.name)", text: $pet.name)
            }
            Section("Breed") {
                TextField("\(pet.breed)", text: $pet.breed)
            }
            Section("Weight") {
                TextField("\(pet.weight)", text: $pet.weight)
            }
            Button("Save") {
                /// It checks if all features are edited/not empty, otherwise alert 
                if !pet.allPropertiesFilled() {
                    showAlert.toggle()
                } else {
                    dismiss()
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
    FeatureView(pet: Pet(name: "Sude", breed: "Cat", weight: "123"))
}
