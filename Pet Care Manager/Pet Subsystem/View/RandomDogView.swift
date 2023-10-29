//
//  RandomDogView.swift
//  Pet Care Manager
//
//  Created by user on 14.10.23.
//
import Foundation
import SwiftUI
import AVKit
// MARK: RandomDogView
/// This view is used to display random dog photos for every click
struct RandomDogView: View {
    @State var viewModel = DogViewModel()
    var body: some View {
        Group {
            /// It is an image
            if viewModel.showImage {
                AsyncImage(
                    /// Passing the url
                    url: URL(string: viewModel.placeHolder)) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 400, height: 500, alignment: .leading)
                            .clipped()
                } placeholder: {
                    ProgressView(viewModel.loadingMessage)
                }
                /// It is a video
            } else if viewModel.showVideo {
                if case let videoURL? = URL(string: viewModel.placeHolder) {
                    VideoPlayer(player: AVPlayer(url: videoURL))
                        .frame(width: 400, height: 700, alignment: .leading)
                }
            } else {
                ProgressView(viewModel.loadingMessage)
            }
        }
        .task {
            /// Fetching the url from media
            viewModel.fetchRandomDogMedia()
        }
        /// Error handling and displaying
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Photo can not be load!"),
                  message: Text("Try reloading the page"),
                  dismissButton: .default(Text("OK")))
        }
    }
}
#Preview {
    RandomDogView()
}
