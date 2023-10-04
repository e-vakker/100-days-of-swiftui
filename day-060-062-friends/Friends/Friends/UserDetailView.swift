//
//  UserDetailView.swift
//  Friends
//
//  Created by Jevgeni Vakker on 09.08.2023.
//

import SwiftUI

struct UserDetailView: View {
    let user: CachedUser
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("User Information")) {
                    HStackWithTopAlignment(label: "Name", value: user.wrappedName)
                    HStackWithTopAlignment(label: "User Active", value: user.isActive ? "Yes" : "No")
                    HStackWithTopAlignment(label: "Age", value: "\(user.age)")
                    HStackWithTopAlignment(label: "Company", value: user.wrappedCompany)
                    HStackWithTopAlignment(label: "Email", value: user.wrappedEmail)
                    HStackWithTopAlignment(label: "Address", value: user.wrappedAddress)
                    HStackWithTopAlignment(label: "About", value: user.wrappedAbout)
                    HStackWithTopAlignment(label: "Registered", value: user.wrappedRegistered)
                }
                
                Section(header: Text("Tags")) {
                    ForEach(user.wrappedTags, id: \.self) { tag in
                        Text(tag)
                    }
                }
                
                Section(header: Text("Friends")) {
                    ForEach(user.friendsArray, id: \.id) { friend in
                        Text(friend.wrappedName)
                    }
                }
            }
            .navigationTitle(user.wrappedName)
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
}

struct UserDetailView_Previews: PreviewProvider {
    static var dataController = DataController()
    
    static var previews: some View {
        let user = CachedUser(context: dataController.container.viewContext)
        user.id = "123"
        user.name = "John Doe"
        user.isActive = true
        user.age = 30
        user.company = "Example Company"
        user.email = "john@example.com"
        user.address = "123 Main St, City"
        user.about = "Lorem ipsum dolor sit amet...frsmfgn rkngfjrsngfjrsgjrgn sgsk"
        user.registered = "2015-11-10T01:47:18-00:00"
        user.tags = "tag1,tag2,tag3,tag3"
        
        return Group {
            UserDetailView(user: user)
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
