//
//  ContentView.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 29.08.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.imageWrappers ?? [], id: \.id) { imageWrapper in
                    imageWrapper.image
                        .resizable()
                        .scaledToFit()
                }
            }
            .navigationTitle("MemPix")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            viewModel.showingAddPersonSheet = true
                        } label: {
                            Image(systemName: "plus.circle.fill")
                            Text("Add new contact")
                                .font(.headline)
                        }
                        Spacer()
                    }
                    
                }
            }
            .sheet(isPresented: $viewModel.showingAddPersonSheet) {
                AddPerson(viewModel: viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
