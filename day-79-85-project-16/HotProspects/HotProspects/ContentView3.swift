//
//  ContentView3.swift
//  HotProspects
//
//  Created by Jevgeni Vakker on 07.09.2023.
//

import SwiftUI

struct ContentView3: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
        
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
