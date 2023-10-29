//
//  AddHistoryView.swift
//  Pet Care Manager
//
//  Created by user on 12.10.23.
//


import SwiftUI
import AlertToast
// MARK: AddHistoryView
/// This view is used to register a history entity/record to the history list of the pet
struct AddHistoryView: View {
    let records = ["Ilness", "Vaccine", "Operation"]
    var pet: Pet
    @Binding var selection: String /// selection binding for getting back to history view after saving
    @State var viewModel = HistoryViewModel()
    var body: some View {
        Form {
            Section("Type") {
                /// Picker to select the record type
                Picker("Record Type", selection: $viewModel.pickedRecord) {
                    ForEach(records, id: \.self) { record in Text(record) }
                }
            }.onChange(of: viewModel.pickedRecord, viewModel.setNewRecord)
            /// Date Picker to select the corresponding date
            Section("Date") {
                DatePicker(selection: $viewModel.record.date, in: ...Date.now, displayedComponents: .date) {
                }.labelsHidden().datePickerStyle(.automatic).frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }
            /// Checking what type is the record
            Section(viewModel.pickedRecord) {
                /// If it is vaccine
                if let rec = viewModel.record as? Vaccine {
                    @Bindable var bRec = rec
                    
                    TextField("Vaccine type", text: $bRec.type)
                    TextField("Dose number", text: $bRec.dose)
                    /// If it is an operation
                } else if let rec = viewModel.record as? Operation {
                    @Bindable var bRec = rec
                    
                    TextField("Name of operation", text: $bRec.name)
                    TextField("Name of operator", text: $bRec.operatedBy)
                    /// If it is an illness
                } else if let rec = viewModel.record as? Ilness {
                    @Bindable var bRec = rec
                    
                    TextField("Name of ilness", text: $bRec.name)
                }
            }
            /// Save button to register the record into history list of the pet
            Button("Save") {
                viewModel.saveRecord(pet: pet)
                selection = "One"
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .toast(isPresenting: $viewModel.showToast) {
                    /// Alert from the third party package
                    AlertToast(type: .regular, title: "Saved!")
                }
        }
    }
}

#Preview {
    AddHistoryView(pet: Pet(name: "Sude", breed: "Cat", weight: "123"), selection: .constant("One"))
}
