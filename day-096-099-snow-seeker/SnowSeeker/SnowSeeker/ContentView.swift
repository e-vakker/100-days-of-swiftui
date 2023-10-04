//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Jevgeni Vakker on 30.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var favorites = Favorites()
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.sortedResorts) { resort in
                    NavigationLink {
                        ResortView(resort: resort)
                    } label: {
                        HStack {
                            Image(resort.country)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 25)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.black, lineWidth: 0.50)
                                )
                            
                            VStack(alignment: .leading, spacing: nil, content: {
                                Text(resort.name)
                                    .font(.headline)
                                Text("\(resort.runs) runs")
                                    .foregroundColor(.secondary)
                            })
                            
                            if favorites.contains(resort) {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibilityLabel("This is a favorite resort")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $viewModel.searchText, prompt: "Search for a resort")
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Sort By", selection: $viewModel.sortOrder) {
                            Text("Default").tag(SortType.defaultOrder)
                            Text("Alphabetical").tag(SortType.alphabetical)
                            Text("Country").tag(SortType.countryOrder)
                        }
                    } label: {
                        Text("Sort by \(viewModel.sortOrder.rawValue)")
                    }
                }
            }
            .animation(.easeIn, value: viewModel.searchText)
            .animation(.easeInOut, value: viewModel.sortOrder)
            
            WelcomeView()
        }
        .environmentObject(favorites)
    }
}

#Preview {
    ContentView()
        .environmentObject(Favorites())
}
