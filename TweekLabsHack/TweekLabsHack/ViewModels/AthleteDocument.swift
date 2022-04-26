//
//  AthleteDocument.swift
//  TweekLabsHack
//
//  Created by Sahil Sahu on 26/04/22.
//

import Foundation
import SwiftUI


class AthleteDocument: ObservableObject {
    
    @Published var athlete: Athlete?
    
    init() {
        athlete = createAthleteObject()
    }
    
    
    //creates athlete object
    private func createAthleteObject() -> Athlete {
        
        var tempAthleteSessions = [AthleteSession]()
        
        tempAthleteSessions.append(AthleteSession(balls_bowled: 2, date: formateDate(dateString: "12/02/2022, 03:24 PM")))
        tempAthleteSessions.append(AthleteSession(balls_bowled: 4, date: formateDate(dateString: "13/02/2022, 04:45 PM")))
        tempAthleteSessions.append(AthleteSession(balls_bowled: 8, date: formateDate(dateString: "14/02/2022, 06:43 AM")))
        
        let tempAthlete: Athlete = Athlete(name: "RA. JADEJA", bowler_type: "Pace Bowler", athlete_sessions: tempAthleteSessions)
        
        return tempAthlete
    }
    
    
    //formatting a date string to a date
    private func formateDate(dateString: String) -> Date {
        
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "dd/MM/yyyy, hh:mm a"
           
           let date = dateFormatter.date(from: dateString)!
           
           return date
    }
    
    //MARK: Intents
    
    //get sum of all balls bowled in all sessions
    func getBallsBowled() -> String {
        
        var ballsBowled = 0
        
        for athleteSession in athlete!.athlete_sessions {
            ballsBowled += athleteSession.balls_bowled
        }
        
        return ballsBowled < 10 ? "0" + String(ballsBowled) : String(ballsBowled)
    }
    
    
    //get total sessions an athlete has done
    func getTotalSessions() -> String {
        
        return athlete!.athlete_sessions.count < 10 ? "0" + String(athlete!.athlete_sessions.count) : String(athlete!.athlete_sessions.count) 
    }
    
}
