//
//  ContentViewModel.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 30.08.2023.
//

import SwiftUI

@MainActor final class ContentViewModel: ObservableObject {
    @Published var imageWrappers: [PersonWrapper]?
    
    @Published var showingAddImageSheet = false
    @Published var showingAddPersonSheet = false
    
    func convertAndAppendImage(inputImage: UIImage, firstName: String, lastName: String) {
        let convertedImage = Image(uiImage: inputImage)
        
        let wrapper = PersonWrapper(image: convertedImage, firstName: firstName, lastName: lastName)
        
        if imageWrappers == nil {
            imageWrappers = [wrapper]
        } else {
            imageWrappers?.append(wrapper)
        }
        self.showingAddPersonSheet = false
    }
}

struct PersonWrapper: Identifiable {
    let id = UUID()
    let image: Image
    let firstName: String
    let lastName: String
}



