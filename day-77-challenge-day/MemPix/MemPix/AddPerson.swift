//
//  AddNameToPicture.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 31.08.2023.
//

import SwiftUI

struct AddPerson: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var context
    
    @State var showingAddImageSheet = false
    
    @State var firstName = ""
    @State var lastName = ""
    
    @State var inputImage: UIImage?
    
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
                        savePerson()
                    }
                    .disabled(inputImage == nil || firstName.isEmpty || lastName.isEmpty)
                }
            }
            .sheet(isPresented: $showingAddImageSheet) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    func savePerson() {
        let person = Contact(firstName: firstName, lastName: lastName, context: context)
        let id = person.uuid
        // Generate a unique filename using UUID
        let uniqueFileName = id.uuidString + ".jpg"
        
        if let image = inputImage {
            if let data = image.jpegData(compressionQuality: 0.8) {
                let filename = FileManager.documentsDirectory.appendingPathComponent(uniqueFileName)
                try? data.write(to: filename)
            }
        }
        PersistenceController.shared.save()
        dismiss()
    }
    
    var photo: some View {
        VStack {
            ZStack {
                Color.clear
                    .aspectRatio(1, contentMode: .fit)
                    .overlay {
                        if let image = inputImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                        } else {
                            Color.gray.opacity(0.40)
                        }
                    }
                    .clipped()
            }
            .aspectRatio(1, contentMode: .fit)
            .RoundedViewStyle()
            .padding([.horizontal])
            Button("Set new photo") {
                showingAddImageSheet = true
            }
            .padding()
        }
    }
}

struct AddNameToPicture_Previews: PreviewProvider {
    static var previews: some View {
        AddPerson()
    }
}
