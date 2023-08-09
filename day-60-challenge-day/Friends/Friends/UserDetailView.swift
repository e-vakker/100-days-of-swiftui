//
//  UserDetailView.swift
//  Friends
//
//  Created by Jevgeni Vakker on 09.08.2023.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("User Information")) {
                    HStackWithTopAlignment(label: "Name", value: user.name)
                    HStackWithTopAlignment(label: "User Active", value: user.isActive ? "Yes" : "No")
                    HStackWithTopAlignment(label: "Age", value: "\(user.age)")
                    HStackWithTopAlignment(label: "Company", value: user.company)
                    HStackWithTopAlignment(label: "Email", value: user.email)
                    HStackWithTopAlignment(label: "Address", value: user.address)
                    HStackWithTopAlignment(label: "About", value: user.about)
                    HStackWithTopAlignment(label: "Registered", value: dateFormatted(date: user.registered))
                }
                
                Section(header: Text("Tags")) {
                    ForEach(user.tags, id: \.self) { tag in
                        Text(tag)
                    }
                }
                
                Section(header: Text("Friends")) {
                    ForEach(user.friends, id: \.id) { friend in
                        Text(friend.name)
                    }
                }
            }
            .navigationTitle(user.name)
        }
    }
    
    struct HStackWithTopAlignment: View {
        let label: String
        let value: String
        
        var body: some View {
            HStack(alignment: .top) {
                Text(label)
                Spacer()
                Text(value)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    func dateFormatted(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "MMM dd, yyyy"
            return dateFormatter.string(from: date)
        } else {
            return date
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(
            id: "123",
            isActive: true,
            name: "John Doe",
            age: 30,
            company: "ABC Inc.",
            email: "john@example.com",
            address: "123 Main St, City, Country",
            about: "Lorem ipsum dolor sit amet..mfnrmjgnerjkgnerkjgnekgnerkgjnerkjgnerk",
            registered: "2023-08-09T12:34:56Z",
            tags: ["tag1", "tag2", "tag3"],
            friends: [
                User.Friend(id: "456", name: "Alice"),
                User.Friend(id: "789", name: "Bob")
            ]
        )
        
        UserDetailView(user: user)
    }
}
