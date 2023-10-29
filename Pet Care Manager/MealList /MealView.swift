//
//  MealView.swift
//  Pet Care Manager
//
//  Created by user on 13.10.23.
//

import SwiftUI
// MARK: MealView
struct MealView: View {
    @Bindable var pet: Pet
    @State var showingSheet = false
    var body: some View {
        List {
            Section {
                /// Dynamic listing to access each element of mealList
                ForEach(pet.mealList, id: \.self) { meal in
                    Text("\(meal)")
                }.onDelete(perform: { indexSet in /// Adding delete function
                    pet.mealList.remove(atOffsets: indexSet)
                })
            }
            Section {
                /// Add Meal button to trigger sheet
                Button("Add Meal") {
                    showingSheet.toggle()
                }.padding(2)
                 .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                 .sheet(isPresented: $showingSheet) {
                     /// If sheet is triggered then navigate to MealAddView 
                     MealAddView(pet: pet)
                 }
            }
        }.navigationTitle("Meals")
            .bold()
    }
}

#Preview {
    MealView(pet: Pet(name: "Sude", breed: "Cat", weight: "122"))
}
