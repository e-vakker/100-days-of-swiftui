//
//  Prospect.swift
//  HotProspects
//
//  Created by Jevgeni Vakker on 10.09.2023.
//

import Foundation


@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
}


class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}
