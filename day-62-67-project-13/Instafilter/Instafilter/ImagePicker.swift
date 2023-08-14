//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Jevgeni Vakker on 14.08.2023.
//

import PhotosUI
import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
}


