//
//  DogViewModel.swift
//  Pet Care Manager
//
//  Created by user on 14.10.23.
//

import Foundation
import OSLog
// MARK: DogViewModel
@Observable class DogViewModel {
    var placeHolder = "" /// placeHolder for optional url string
    var showError = false /// variable for alert
    var showImage = false /// variable to check if API returns image
    var showVideo = false /// varable to check if API returns video
    var loadingMessage = "Loading"
    /// Fetching the url
    func fetchRandomDogMedia() {
        Task {
            /// Handling error
            do {
                loadingMessage = "Loading"
                placeHolder = try await Pet.fetchDogFromMediaURL(from: URL(string: "https://random.dog/woof.json") ?? URL.applicationDirectory)
                /// Setting false in order to reset both variables after each click
                showError = false
                showVideo = false
                showImage = false
                if placeHolder.hasSuffix(".mp4") {
                    /// API returned a video
                    showVideo = true
                } else if placeHolder.hasSuffix(".webm") {
                    /// API returned a .webm file, which is not supported by AVKit
                    showError = true
                    loadingMessage = ".webm format is not supported"
                } else {
                    /// API returned an image
                    showImage = true
                }
            } catch {
                showError = true
            }
        }
    }
}
