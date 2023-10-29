//
//  AppointmentViewModel.swift
//  Pet Care Manager
//
//  Created by user on 14.10.23.
//

import Foundation
// MARK: AppointmentViewModel
@Observable class AppointmentViewModel {
    var showingSheet = false
    var isSortingOn = false  /// Bool variable to store if sorting toggle is enabled
    /// Function to sort all appointments of a pet by date if sorting toggle is enabled
    func sortAppointments(_ appointments: [Appointment]) -> [Appointment] {
        if isSortingOn {
            /// Sorting toggle on = sort appointment
            return appointments.sorted(by: { $0.date < $1.date })
        } else {
            /// No sorting needed
            return appointments
        }
    }
}
