//
//  AddNameToPicture.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 31.08.2023.
//

import SwiftUI
import MapKit

struct AddPerson: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var context
    
    @State private var showingAddImageSheet = false
    
    @State private var firstName = ""
    @State private var lastName = ""
    
    @State private var inputImage: UIImage?
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    @State private var places:[Place] = []
    
    var body: some View {
        NavigationStack {
            List {
                photo
                Section {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                } header: {
                    Text("Write your friend's first and last name")
                }
                Section {
                    ZStack {
                        Map(coordinateRegion: $mapRegion, annotationItems: places) {
                            place in
                            MapMarker(coordinate: place.location, tint: .purple)
                        }
                        Circle()
                            .fill(.blue)
                            .opacity(0.3)
                            .frame(width: 32, height: 32)
                        
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button {
                                    let place = Place(lat: mapRegion.center.latitude, long: mapRegion.center.longitude)
                                    places.isEmpty ? places.append(place) : (places[0] = place)
                                } label: {
                                    Image(systemName: "plus")
                                        .padding()
                                        .background(.blue.opacity(0.75))
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .clipShape(Circle())
                                        .padding()
                                }
                            }
                        }
                    }
                    .aspectRatio(1.0, contentMode: .fit)
                    .RoundedViewStyle()
                    .padding()
                } header: {
                    Text("Pick a place where your friend lives")
                }
            }
            .listStyle(.inset)
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
        let longitude = places[0].location.longitude
        let latitude = places[0].location.latitude
        let person = Contact(firstName: firstName, lastName: lastName, longitude: longitude, latitude: latitude, context: context)
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
