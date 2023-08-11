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
            await model.JSONLoader()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
