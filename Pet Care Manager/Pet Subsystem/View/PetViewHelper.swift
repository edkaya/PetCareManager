//
//  PetViewHelper.swift
//  Pet Care Manager
//
//  Created by user on 13.10.23.
//

import SwiftUI
// MARK: PetViewHelper
// This View puts three navigation links together to have a better look
struct PetViewHelper: View {
    var pet: Pet
    var body: some View {
        NavigationLink(destination: { AppointmentView(pet: pet)
        }, label: { /// Navigate to Appointments
            Text("Appointments")
        })
        NavigationLink(destination: { MedicationView(pet: pet)
        }, label: { /// Navigate to Medications
            Text("Medications")
        })
        NavigationLink(destination: { MealView(pet: pet)
        }, label: { /// Navigate to Meals 
            Text("Meals")
        })
    }
}

#Preview {
    PetViewHelper(pet: Pet(name: "Sude", breed: "Cat", weight: "122"))
}
