//
//  PetView .swift
//  Pet Care Manager
//
//  Created by user on 12.10.23.
//

import SwiftUI
// MARK: PetView
/// This view is used to display the options for history records, appointments, medications and meals of the pet
struct PetView: View {
    var pet: Pet
    @State var showingSheet = false
    var body: some View {
        VStack(spacing: 4) {
            /// Title of the page - the name of the pet
            Text("\(pet.name)")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Spacer()
                .frame(height: 20)
            Group { /// Pets other features
                Text("\(pet.breed)")
                Text("\(pet.weight)kg")
            }.foregroundColor(.secondary)
            List { /// Navigate to History
                NavigationLink(destination: { TabViewHistory(pet: pet) }, label: {
                    Text("History")
                })
                Section { /// Navigate to Appointments/Medications/Meals
                    PetViewHelper(pet: pet)
                }
                Section { /// Navigate to Daily Dog Media
                    NavigationLink(destination: { RandomDogView() }, label: {
                            Text("Daily Dog Media")
                    })
                }
                Section { /// Edit feature to trigger sheet
                    Button("Edit Features") {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        /// Navigate to FeatureView 
                        FeatureView(pet: pet)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                }
            }
        }.background(Color(uiColor: UIColor.systemGroupedBackground))
    }
}

#Preview {
    PetView(pet: Pet(name: "Sude", breed: "Cat", weight: "100"))
}
