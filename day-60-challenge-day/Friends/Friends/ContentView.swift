//
//  ContentView.swift
//  Friends
//
//  Created by Jevgeni Vakker on 09.08.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = Model()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(model.users, id: \.id) { user in
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        UserView(name: user.name, email: user.email)
                    }
                    
                }
            }
            .navigationTitle("Friends")
        }
        .task {
            await loadData()
            model.userSort()
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
                model.users = decodedResponse
            }
        } catch {
            print("invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
