//
//  AthleteSessionsView.swift
//  TweekLabsHack
//
//  Created by Sahil Sahu on 26/04/22.
//

import SwiftUI

struct AthleteSessionsView: View {
    
    var athleteSessions: [AthleteSession]
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("ATHLETE SESSIONS")
                .font(.custom("OpenSans-Bold", size: 20))
                .foregroundColor(DrawingConstants.darkRed)
                
            GeometryReader { geometry in
                ScrollView{
                    ForEach(athleteSessions){ session in
                        HStack{
                            
                            Image("calendar.filled")
                                .padding()
                            
                            VStack(alignment: .leading) {
                                
                                Text("Session \(athleteSessions.firstIndex{$0.id == session.id}! + 1)")
                                    .padding(.bottom, 3)
                                    .font(.custom("OpenSans-Bold", size: 18))
                                    .foregroundColor(DrawingConstants.darkBlack)
                                    
                                
                                HStack{
                                    Text("\(session.balls_bowled) BALLS ")
                                        .font(.custom("OpenSans-Bold", size: 14))
                                        .foregroundColor(DrawingConstants.darkRed)
                                    Text("\(formatDate(date: session.date))")
                                        .font(.custom("OpenSans-SemiBold", size: 14))
                                        .foregroundColor(DrawingConstants.darkBlack)
                                        
                                }
                                
                            }
                        
                            
                            Spacer()
                        }
                        .padding()
                        .background(DrawingConstants.lightGray)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                                    .stroke(DrawingConstants.textFieldOutlineGray, lineWidth: 0.3))
                        .padding(.top)
                    }
                    
                }
                
            }
        }
        .padding()
        .padding()
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct AthleteSessionsView_Previews: PreviewProvider {
   
    static var previews: some View {
        
        AthleteSessionsView(athleteSessions: createAthleteSessionsDummyData())
    }
}

func createAthleteSessionsDummyData() -> [AthleteSession]{
    var tempAthleteSessions = [AthleteSession]()
    
    tempAthleteSessions.append(AthleteSession(balls_bowled: 2, date: formatDate(date: "12/02/2022, 03:24 PM")))
    tempAthleteSessions.append(AthleteSession(balls_bowled: 4, date: formatDate(date: "13/02/2022, 04:45 PM")))
    tempAthleteSessions.append(AthleteSession(balls_bowled: 8, date: formatDate(date: "14/02/2022 06:43 AM")))
    
    return tempAthleteSessions
}

private func formatDate(date: String) -> Date {
    
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "MM/dd/yy, hh:mm a"
       
       let date = dateFormatter.date(from: date) ?? Date()
       
       return date
}

private func formatDate(date: Date) -> String {
    
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "MM/dd/yy, hh:mm a"
       
       let date = dateFormatter.string(from: date)
       
       return date
}
