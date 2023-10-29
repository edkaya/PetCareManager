//
//  MainPageView.swift
//  Pet Care Manager
//
//  Created by user on 11.10.23.
//

import SwiftUI
// MARK: AddPetView
/// This view is to navigate to other views if addPet Button is clicked
struct AddPetView: View {
    @State var addPetButton = false
    @Bindable var myPets: CollectionOfPets
    @Bindable var pet: Pet
    var body: some View {
        return Group {
            /// If the addPetButton is clicked, navigate back to RegisterView
            if addPetButton {
                RegisterView(myPets: myPets, pet: Pet(name: "", breed: "", weight: ""))
            } else {
                /// If the addPetButton is not clicked, show the MainPageView
                MainPageView(addPetButton: $addPetButton, pet: pet, myPets: myPets)
            }
        }
    }
}
// MARK: MainPageView
/// This view is used to reflect the main page, where all registered pets are listed
struct MainPageView: View {
    @Binding var addPetButton: Bool
    @Bindable var pet: Pet
    @Bindable var myPets: CollectionOfPets
    var body: some View {
        NavigationView {
            VStack(spacing: 4) {
                Spacer()
                    .frame(height: 20)
                VStack {
                    Image("AppLogo")
                        .resizable()
                        .scaledToFit()
                        .mask(RoundedRectangle(cornerRadius: 50))
                        .frame(width: 100)
                    List {
                        /// Dynamic listing to access each element and display it
                        ForEach(myPets.pets, id: \.name) { perun in
                            HStack {
                                NavigationLink(destination: {
                                    PetView(pet: perun)
                                }, label: {
                                    Text(perun.name + "(\(perun.breed))")
                                    })
                            }
                        }.onDelete(perform: { indexSet in
                            myPets.pets.remove(atOffsets: indexSet)
                        })
                    }.listStyle(.insetGrouped)
                    /// Tracking if addPetButton is clicked
                    Button("Add Pet") {
                        addPetButton.toggle()
                    }
                    .bold()
                    .padding(6)
                }
            }.background(Color(uiColor: UIColor.systemGroupedBackground))
        }
    }
}

#Preview {
    AddPetView(myPets: CollectionOfPets.mockPetCollection(), pet: Pet(name: "", breed: "", weight: ""))
}
