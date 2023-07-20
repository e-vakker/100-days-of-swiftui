//
//  CrewMember.swift
//  Moonshot
//
//  Created by Jevgeni Vakker on 20.07.2023.
//

import Foundation

struct CrewMember {
    let role: String
    let astronaut: Astronaut
    
    static func addCrewMembers(mission: Mission, astronauts: [String: Astronaut]) -> [CrewMember] {
        let crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
        return crew
    }
}
