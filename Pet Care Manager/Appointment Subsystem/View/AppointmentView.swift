//
//  AppointmentView.swift
//  Pet Care Manager
//
//  Created by user on 13.10.23.
//

import SwiftUI
import Foundation
import AlertToast
// MARK: AppointmentView
/// This view enables to display registered appointments as a list
/// and enables sorting by date
struct AppointmentView: View {
    var pet: Pet
    @State var viewModel = AppointmentViewModel()
    @State var showToast = false
    var body: some View {
        List {
            Section {
                /// Dynamic listing to access each property of an appointment
                /// Passing computed variable of the viewModel
                ForEach(viewModel.sortAppointments(pet.appointments), id: \.date) { app in
                    HStack {
                        Text("\(app.location)")
                        Spacer()
                        Text("\(app.formattedDate)")
                        Spacer()
                        /// Formatting time to display a proper time text
                        Text("\(app.time.formatted(date: .omitted, time: .shortened))")
                    }
                }.onDelete(perform: { indexSet in /// Adding delete option
                    pet.appointments.remove(atOffsets: indexSet)
                })
            }
            Toggle(isOn: $viewModel.isSortingOn) {
                Text("Sort By Date")
            }
            Section {
                Button("Add Appointment") {
                    viewModel.showingSheet.toggle()
                }.padding(2)
                 .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                /// If add appointment button is clicked, then a sheet shows up to register an appointment
                 .sheet(isPresented: $viewModel.showingSheet) {
                     AppointmentAddView(pet: pet, showToast: $showToast)
                 }
            }
        }.navigationTitle("Appointments")
            .bold()
            .animation(.easeInOut, value: viewModel.isSortingOn)
            .toast(isPresenting: $showToast) {
                /// Alert from the third party package
                AlertToast(type: .complete(Color.blue), title: "Saved!")
            }
    }
}

#Preview {
    AppointmentView(pet: Pet(name: "Sude", breed: "Cat", weight: "120"))
}
