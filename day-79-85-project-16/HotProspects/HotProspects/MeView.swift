//
//  MeView.swift
//  HotProspects
//
//  Created by Jevgeni Vakker on 10.09.2023.
//

import SwiftUI

struct MeView: View {
    @EnvironmentObject var prospects: Prospects
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
            .environmentObject(Prospects())
    }
}
