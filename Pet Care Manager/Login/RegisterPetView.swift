//
//  RegisterPetView.swift
//  Pet Care Manager
//
//  Created by user on 11.10.23.
//

import SwiftUI
// MARK: RegisterView
/// This view is to navigate to other views if continue button is clicked
struct RegisterView: View {
    @State var continueButton = false
    @Bindable var myPets: CollectionOfPets
    @Bindable var pet: Pet
    var body: some View {
        return Group {
            if continueButton {
                /// If the continueButton is clicked, show the AddPetView
                AddPetView(myPets: myPets, pet: pet)
            } else {
                /// If the continueButton is not clicked, show the RegisterPetView
                RegisterPetView(continueButtonClicked: $continueButton, pet: pet, myPets: myPets)
            }
        }
    }
}
// MARK: RegisterPetView
/// PetView to register pet
struct RegisterPetView: View {
    @Binding var continueButtonClicked: Bool
    @Bindable var pet: Pet
    @Bindable var myPets: CollectionOfPets
    @State var showAlert = false
    var body: some View {
        VStack(spacing: 120) {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .mask(RoundedRectangle(cornerRadius: 50))
                .frame(width: 200)
                .shadow(radius: 10)
            List {
                HStack(spacing: 16) {
                   Text("Pet name : ")
                    TextField("type here", text: $pet.name)
                }.frame(height: 70)
                HStack(spacing: 45) {
                    Text("Breed : ")
                    TextField("type here", text: $pet.breed)
                }.frame(height: 70)
                HStack(spacing: 38) {
                    Text("Weight : ")
                    TextField("type here", text: $pet.weight)
                }.frame(height: 70)
            }.listStyle(.inset)
                .bold()
            Button("Save") {
                /// If all properties are not edited/fulfilled by user, then it should alert
                /// Pet is not registered in that case
                if !pet.allPropertiesFilled() {
                    showAlert = true
                } else {
                    /// Pet is registered
                    myPets.addPet(pet: pet)
                    continueButtonClicked.toggle()
                }
            }.buttonStyle(.borderedProminent)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("You need to fill out all the options!"),
                          message: Text("Try again"),
                          dismissButton: .default(Text("OK")))
                }
        }
    }
}
#Preview {
    RegisterView(myPets: CollectionOfPets.mockPetCollection(), pet: Pet(name: "Ege", breed: "Cat", weight: "122"))
}
