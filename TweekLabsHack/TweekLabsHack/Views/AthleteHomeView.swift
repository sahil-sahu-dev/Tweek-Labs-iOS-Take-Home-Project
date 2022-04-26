//
//  ContentView.swift
//  TweekLabsHack
//
//  Created by Sahil Sahu on 26/04/22.
//

import SwiftUI

struct AthleteHomeView: View {
    
    @ObservedObject var athleteDoc: AthleteDocument
    @State var isUserLoggedOut = false
    
    var body: some View {
        
        if isUserLoggedOut {
            VStack{
                
            }
            .fullScreenCover(isPresented: $isUserLoggedOut, onDismiss: nil) {
                LoginView {
                    self.isUserLoggedOut = false
                }
            }
        }
        
        else{
            ZStack{
                DrawingConstants.redLinearGradient.edgesIgnoringSafeArea(.all)
                VStack{
                    userDetailsView
                    ZStack{
                        
                        AthleteSessionsView(athleteSessions: athleteDoc.athlete!.athlete_sessions)
                        
                            .cornerRadius(40, corners: [.topLeft, .topRight])
                        
                        .overlay(plusCircle, alignment: .bottomTrailing)
                        
                    }
                    
                    
                }
            }
        }
    }
    
    var plusCircle: some View {
        Button {
            
        } label: {
            DrawingConstants.redLinearGradient
                .frame(width: 67, height: 67)
                .cornerRadius(40)
                .padding()
                .overlay(Image("plus"), alignment: .center)
                .shadow(radius: 30)
        }
    }
    
    var userDetailsView: some View {
        
        VStack(spacing: 5){
            Image("user")
                .padding()
            
            Text(athleteDoc.athlete!.name)
                .font(.custom("OpenSans-Bold", size: 28))
                .foregroundColor(.white)
            
            Text(athleteDoc.athlete!.bowler_type)
                .font(.custom("OpenSans-Regular", size: 18))
                .foregroundColor(.white)
            
            HStack{
                VStack{
                    HStack{
                        Image("ball")
                        Text(athleteDoc.getBallsBowled())
                            .font(.custom("OpenSans-Bold", size: 32))
                            .foregroundColor(.white)
                    }
                    
                    Text("Balls Bowled")
                        .foregroundColor(.white)
                        .font(.custom("OpenSans-Bold", size: 12))
                }
                .padding()
                
                VStack{
                    HStack{
                        Image("calendar")
                        Text(athleteDoc.getTotalSessions())
                            .font(.custom("OpenSans-Bold", size: 32))
                            .foregroundColor(.white)
                    }
                    
                    Text("Total Sessions")
                        .foregroundColor(.white)
                        .font(.custom("OpenSans-Bold", size: 12))
                }
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


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
            .edgesIgnoringSafeArea(.all)
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
