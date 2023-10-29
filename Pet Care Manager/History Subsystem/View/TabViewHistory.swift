//
//  TabViewHistory.swift
//  Pet Care Manager
//
//  Created by user on 13.10.23.
//

import SwiftUI
// MARK: TabViewHistory
/// This view is used to display history records of a pet and to register a history record
/// with two tab options
struct TabViewHistory: View {
    var pet: Pet
    @State var selection = "One"
    var body: some View {
        TabView(selection: $selection) {
            /// Navigate to HistoryView (first option)
            HistoryView(pet: pet)
                .tabItem {
                    Label("History", systemImage: "list.dash")
                }
                .tag("One")
            /// Navigate to AddHistoryView (second option)
            AddHistoryView(pet: pet, selection: $selection)
                .tabItem {
                    Label("Add Entity", systemImage: "square.and.pencil")
                }
                .tag("Two")
        }.navigationTitle("History")
            .bold()
    }
}
#Preview {
    TabViewHistory(pet: Pet(name: "Sude", breed: "Cat", weight: "120"))
}
