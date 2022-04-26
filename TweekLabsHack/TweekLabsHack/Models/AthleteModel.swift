//
//  AthleteModel.swift
//  TweekLabsHack
//
//  Created by Sahil Sahu on 26/04/22.
//

import Foundation


struct Athlete: Identifiable {
    
    static var idGenerator: Int = 0
    var id: Int
    var name: String
    var bowler_type: String
    var athlete_sessions: [AthleteSession]
    
    init(name: String, bowler_type: String, athlete_sessions: [AthleteSession]) {
        
        self.id = Athlete.idGenerator
        self.name = name
        self.bowler_type = bowler_type
        self.athlete_sessions = athlete_sessions
        
        Athlete.idGenerator += 1
    }
    
}


struct AthleteSession: Identifiable {
    
    static var idGenerator: Int = 0
    var id: Int
    var balls_bowled: Int
    var date: Date // format = dd/mm/yyyy, mm:hh aa
    
    init(balls_bowled: Int, date: Date) {
        
        self.id = Athlete.idGenerator
        self.balls_bowled = balls_bowled
        self.date = date
        
        Athlete.idGenerator += 1
    }
    
}
