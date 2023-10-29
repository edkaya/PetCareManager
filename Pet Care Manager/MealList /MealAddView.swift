//
//  MealAddView.swift
//  Pet Care Manager
//
//  Created by user on 13.10.23.
//

import SwiftUI
// MARK: MealAddView
struct MealAddView: View {
    @Environment(\.dismiss) var dismiss /// To dismiss the sheet
    @Bindable var pet: Pet
    @State var meal = "" /// Storing in meal string
    @State var showAlert = false
    var body: some View {
        Form {
            Section("Name") {
                TextField("type here", text: $meal)
            }
            Button("Save") {
                /// If there is no input, show alert
                if meal.isEmpty {
                    showAlert = true
                } else {
                    /// If there is input, add meal to mealList of pet
                    dismiss()
                    pet.addMealToList(meal: meal)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("You need to fill out the name of the meal!"),
                      message: Text("Try again"),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    MealAddView(pet: Pet(name: "Sude", breed: "Cat", weight: "12"))
}
