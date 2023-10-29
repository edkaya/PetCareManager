//
//  WelcomePCMView.swift
//  Pet Care Manager
//
//  Created by user on 11.10.23.
//

import SwiftUI
// MARK: WelcomeView
/// This view is to navigate to other views if startButton is clicked
struct WelcomeView: View {
    @State var startButton = false
    @State var collectionOfPets = CollectionOfPets()
    var body: some View {
        return Group {
            if startButton {
                /// If the startButton is clicked, show the RegisterView
                RegisterView(myPets: collectionOfPets, pet: Pet(name: "", breed: "", weight: ""))
            } else {
                /// If the startButton is not clicked, show the WelcomePCMView
                WelcomePCMView(startButtonClicked: $startButton)
            }
        }
    }
}
// MARK: WelcomePCMView
/// Another WelcomeView to enable animation and catch if startButton is clicked
struct WelcomePCMView: View {
    @Binding var startButtonClicked: Bool
    @State var showLoginButton = false
    var body: some View {
        VStack(spacing: 0) {
            LogoStartView()
            if showLoginButton {
                /// // Show the "Let's Start" button when showLoginButton is true
                Button("Let's Start") {
                    startButtonClicked.toggle()
                }.buttonStyle(.borderedProminent)
            }
        }.task {
            animate() /// Perform the animation when the task is run
        }
    }
    func animate() {
        let animation = Animation
            .easeInOut(duration: 0.5)
            .delay(1)
        
        withAnimation(animation) {
            /// Animate the appearance of the showLoginButton with a delay
            self.showLoginButton = true
        }
    }
}

#Preview {
    WelcomeView()
}
