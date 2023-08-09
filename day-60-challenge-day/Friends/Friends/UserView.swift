//
//  UserView.swift
//  Friends
//
//  Created by Jevgeni Vakker on 09.08.2023.
//

import SwiftUI

struct UserView: View {
    let name: String
    let email: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(name)")
                .font(.headline)
            Text("\(email)")
                .foregroundColor(.secondary)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(name: "John Wick", email: "johnwick@gmail.com")
    }
}
