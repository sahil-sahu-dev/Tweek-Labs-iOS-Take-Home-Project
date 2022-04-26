//
//  AthleteModel.swift
//  TweekLabsHack
//
//  Created by Sahil Sahu on 26/04/22.
//

import Foundation


struct Athlete: Identifiable {
    
    var id: Int
    var name: String
    var bowler_type: String
    var athlete_sessions: [AthleteSession]
}


struct AthleteSession: Identifiable {
    
    var id: Int
    var balls_bowled: Int
    var date: Date // format = dd/mm/yyyy, mm:hh aa
    
}
