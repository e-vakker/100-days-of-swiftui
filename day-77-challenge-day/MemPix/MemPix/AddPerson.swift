//
//  AddNameToPicture.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 31.08.2023.
//

import SwiftUI

struct AddPerson: View {
    @ObservedObject var viewModel: ContentViewModel
    
    @State private var firstName = ""
    @State private var lastName = ""
    
    @State private var inputImage: UIImage?

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(.clear)
                        if let image = inputImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .strokeBorder(.quaternary, lineWidth: 0.5)
                                }
                                .padding()
                        } else {
                            Text("Tap to select a picture")
                                .foregroundColor(.primary)
                                .font(.headline)
                                .onTapGesture {
                                    viewModel.showingAddImageSheet = true
                                }
                        }
                    }
                }
                
                TextField("First Name", text: $firstName)
                    .padding()
                
                TextField("Last Name", text: $lastName)
                    .padding()
                Spacer()
            }
            .toolbar {
                ToolbarItem {
                    Button("Save") {
                        viewModel.convertAndAppendImage(inputImage: inputImage!, firstName: firstName, lastName: lastName)
                    }
                    .disabled(inputImage == nil)
                }
            }
            .sheet(isPresented: $viewModel.showingAddImageSheet) {
                ImagePicker(image: $inputImage)
            }
        }
        
        
    }
}

struct AddNameToPicture_Previews: PreviewProvider {
    static var previews: some View {
        AddPerson(viewModel: ContentViewModel())
    }
}
