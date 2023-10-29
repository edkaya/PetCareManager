//
//  AppointmentAddView.swift
//  Pet Care Manager
//
//  Created by user on 13.10.23.
//

import SwiftUI
import AlertToast
// MARK: AppointmentAddView
/// This view is used to register an appointment as a sheet
struct AppointmentAddView: View {
    @Environment(\.dismiss) var dismiss /// Dismiss button to dismiss sheet
    @Bindable var pet: Pet
    @State var showAlert = false
    @Binding var showToast: Bool
    @State var appointment = Appointment(location: "", time: Date(), date: Date())
    var body: some View {
        Form {
            /// Registering location
            Section("Location") {
                TextField("type a city", text: $appointment.location)
            }
            /// Date Picker to register the corresponding date
            Section("Date") {
                DatePicker(selection: $appointment.date, in: Date.now..., displayedComponents: .date) {
                }.labelsHidden()
                    .datePickerStyle(.graphical)
                 .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }
            /// Date Picker to register the corresponding time
            Section("Time") {
                DatePicker("", selection: $appointment.time, displayedComponents: .hourAndMinute).labelsHidden()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }
            Button("Save") {
                /// If the location is empty/not edited, then alert
                if appointment.location.isEmpty {
                    showAlert.toggle()
                } else {
                    /// If the location is not empty, dismiss sheet
                    dismiss()
                    pet.addAppointment(app: appointment)
                    showToast.toggle()
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("You need to fill out the location!"),
                      message: Text("Try again"),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    AppointmentAddView(pet: Pet(name: "sude", breed: "cat", weight: "22"), showToast: .constant(false))
}
