//
//  LogoStartView.swift
//  Pet Care Manager
//
//  Created by user on 13.10.23.
//

import SwiftUI
// MARK: LogoStartView
/// Represents the logo and the "Welcome to Pet Care Manager" text
struct LogoStartView: View {
    var body: some View {
        Image("AppLogo")
            .resizable()
            .scaledToFit()
            .mask(RoundedRectangle(cornerRadius: 50))
            .frame(width: 240)
            .shadow(radius: 10)
        Spacer()
            .frame(minHeight: 0, idealHeight: 32, maxHeight: 32)
        Text("Welcome to")
            .font(.system(size: 20))
        Text("Pet Care Manager")
            .font(Font.custom("KaushanScript-Regular", size: 40))
        Spacer()
            .frame(minHeight: 8, idealHeight: 48, maxHeight: 48)
    }
}

#Preview {
    LogoStartView()
}
