//
//  ContentView.swift
//  TweekLabsHack
//
//  Created by Sahil Sahu on 26/04/22.
//

import SwiftUI

struct AthleteHomeView: View {
    
    @ObservedObject var athleteDoc: AthleteDocument
    
    var body: some View {
        VStack{
            
            ForEach(athleteDoc.athlete!.athlete_sessions){ session in
                Text("\(session.balls_bowled)")
                Text("\(formatDate(date: session.date))")
            }
        }
    }
    
    
    private func formatDate(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy, hh:mm a"
        
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AthleteHomeView(athleteDoc: AthleteDocument())
    }
}
