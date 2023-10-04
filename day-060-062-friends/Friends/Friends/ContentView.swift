//
//  ContentView.swift
//  Friends
//
//  Created by Jevgeni Vakker on 09.08.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @StateObject var model = Model()
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var users: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        UserView(name: user.wrappedName, email: user.wrappedEmail)
                    }
                }
            }
            .navigationTitle("Friends")
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                DispatchQueue.main.async {
                    model.users = decodedResponse
                    for user in model.users {
                        let cashedUser = CachedUser(context: moc)
                        cashedUser.update(with: user, context: moc)
                    }
                    
                    do {
                        if moc.hasChanges {
                            try moc.save()
                        }
                    } catch {
                        print("Error saving to Core Data: \(error)")
                    }
                }
            }
        } catch {
            print("invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var dataController = DataController()
    
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}
