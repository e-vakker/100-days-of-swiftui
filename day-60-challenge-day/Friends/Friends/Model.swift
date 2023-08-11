//
//  Model.swift
//  Friends
//
//  Created by Jevgeni Vakker on 09.08.2023.
//

import Foundation

class Model: ObservableObject, Decodable {
    @Published var users: [User] = []
    
    enum CodingKeys: CodingKey {
        case users
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        users = try container.decode([User].self, forKey: .users)
    }
    
    init() { }
    
    func JSONLoader() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                self.users = decodedResponse
            }
        } catch {
            print("invalid data")
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


