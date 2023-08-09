//
//  Model.swift
//  Friends
//
//  Created by Jevgeni Vakker on 09.08.2023.
//

import Foundation

class Model: ObservableObject, Codable {
    @Published var users: [User] = []
    
    enum CodingKeys: CodingKey {
        case users
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        users = try container.decode([User].self, forKey: .users)
    }
    
    init() { }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(users, forKey: .users)
    }
    
    func userSort() {
        users.sort {
            $0.name < $1.name
        }
    }
}

struct User: Codable, Identifiable {
    struct Friend: Codable {
        var id: String
        let name: String
    }
    
    let id: String
    let isActive: Bool
    let name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    let registered: String
    let tags: [String]
    var friends: [Friend]
    
}


