//
//  ContenView-ViewModel.swift
//  SnowSeeker
//
//  Created by Jevgeni Vakker on 03.10.2023.
//

import Foundation

enum SortType: String {
    case defaultOrder = "Default"
    case alphabetical = "Alphabetical"
    case countryOrder = "Country Order"
}

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
       
        let resorts: [Resort] = Bundle.main.decode("resorts.json")
        
        @Published var searchText = ""
        @Published var sortOrder: SortType = .defaultOrder
        
        var filteredResorts: [Resort] {
            if searchText.isEmpty {
                return resorts
            } else {
                return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
            }
        }
        
        var sortedResorts: [Resort] {
            switch sortOrder {
            case .defaultOrder:
                return filteredResorts
            case .alphabetical:
                return filteredResorts.sorted { $0.name < $1.name }
            case .countryOrder:
                return filteredResorts.sorted { $0.country < $1.country }
            }
        }
    }
}
