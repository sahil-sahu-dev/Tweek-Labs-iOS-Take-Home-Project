//
//  AthleteSessionsView.swift
//  TweekLabsHack
//
//  Created by Sahil Sahu on 26/04/22.
//

import SwiftUI

struct AthleteSessionsView: View {
    var body: some View {
        VStack{
            HStack{
                Text("ATHLETE SESSIONS")
                    .font(.custom("OpenSans-Bold", size: 20))
                    .foregroundColor(DrawingConstants.darkRed)
                Spacer()
            }
            .padding(.horizontal)
            
            GeometryReader { geometry in
                ScrollView{
                    
                }
            }
        }
    }
}

struct AthleteSessionsView_Previews: PreviewProvider {
    static var previews: some View {
        AthleteSessionsView()
    }
}
