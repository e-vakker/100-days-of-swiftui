//
//  CrewView.swift
//  Moonshot
//
//  Created by Jevgeni Vakker on 20.07.2023.
//

import SwiftUI

struct CrewView: View {
    
    let crew: [CrewMember]
    
    let launchDate: String
    
    var body: some View {
        VStack {
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink {
                            AstronautView(astronaut: crewMember.astronaut)
                        } label: {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 75)
                                    .clipShape(Circle())
                                    .overlay {
                                        Circle()
                                            .strokeBorder(.black, lineWidth: 0.25)
                                    }
                                
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
            }
            if launchDate != "N/A" {
                VStack {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.lightBackground)
                        .padding(.top)
                    Text("Launch Date: \(launchDate)")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                }
            }
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.lightBackground)
                .padding(launchDate != "N/A" ? .bottom : .vertical)
        }
    }
}

struct CrewView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        let crew: [CrewMember] = CrewMember.addCrewMembers(mission: missions[1], astronauts: astronauts)
        
        CrewView(crew: crew, launchDate: missions[1].formattedLaunchDate)
            .preferredColorScheme(.dark)
    }
}
