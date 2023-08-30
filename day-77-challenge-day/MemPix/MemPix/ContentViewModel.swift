//
//  ContentViewModel.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 30.08.2023.
//

import SwiftUI

extension ContentView {
    @MainActor final class ViewModel: ObservableObject {
        @Published var inputImage: UIImage? {
            didSet {
                convertAndAppendImage()
            }
        }
        
        @Published var imageWrappers: [ImageWrapper]?
        @Published var showingAddContactSheet = false
        
        func convertAndAppendImage() {
            if let inputImage = inputImage {
                let convertedImage = Image(uiImage: inputImage)
                
                let wrapper = ImageWrapper(image: convertedImage)
                
                if imageWrappers == nil {
                    imageWrappers = [wrapper]
                } else {
                    imageWrappers?.append(wrapper)
                }
                
                self.inputImage = nil
            }
        }
    }
}

struct ImageWrapper: Identifiable {
    let id = UUID()
    let image: Image
}



