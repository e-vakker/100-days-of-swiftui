//
//  AddNameToPicture.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 31.08.2023.
//

import SwiftUI

struct AddPerson: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: ContentViewModel
    
    @State private var firstName = ""
    @State private var lastName = ""
    
    @State private var inputImage: UIImage?

    var body: some View {
        NavigationStack {
            photo
            List {
                Section {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                } header: {
                    Text("Write your friend's first and last name")
                }
            }
            .navigationTitle("New person")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        viewModel.convertAndAppendImage(inputImage: inputImage!, firstName: firstName, lastName: lastName)
                    }
                    .disabled(inputImage == nil || firstName.isEmpty || lastName.isEmpty)
                }
            }
            .sheet(isPresented: $viewModel.showingAddImageSheet) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    var photo: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.clear)
                if let image = inputImage {
                    Image(uiImage: image)
                        .resizable()
                } else {
                    ZStack {
                        Color.gray.opacity(0.40)
                    }
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .strokeBorder(.quaternary, lineWidth: 0.5)
            }
            .padding([.horizontal])
            Button("Set new photo") {
                viewModel.showingAddImageSheet = true
            }
            .padding()
        }
    }
}

struct AddNameToPicture_Previews: PreviewProvider {
    static var previews: some View {
        AddPerson(viewModel: ContentViewModel())
    }
}
