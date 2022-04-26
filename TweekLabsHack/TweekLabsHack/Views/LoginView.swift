//
//  LoginView.swift
//  TweekLabsHack
//
//  Created by Sahil Sahu on 26/04/22.
//

import SwiftUI

struct AccountDetails {
    
    static fileprivate let password = "Password"
    static fileprivate let phone = "9876543210"
}

struct LoginView: View {
    
    @State private var phoneNum: String = ""
    @State private var password: String = ""
    
    let didCompleteLoginProcess: () -> ()
    
    
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                
                Image("logo")
                    .padding()
                
                Spacer()
                
                phoneNumInputView
                    .padding(.top)
                    .padding(.horizontal)
               
                passwordInputView
                    .padding(.horizontal)
                
                HStack {
                    forgotPasswordButton
                        .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                signInButton
                    .padding(.horizontal)
                    .padding(.bottom)
                
                
                HStack{
                    Spacer()
                    grayLine
                        Spacer()
                    
                    Text("Don't have an account?")
                        .foregroundColor(DrawingConstants.darkBlack)
                        .font(.custom("OpenSans-Regular", size: 16))
                        
                    Spacer()
                    
                    grayLine
                    Spacer()
                }
                .padding(.horizontal)
                
                signUpButton.padding(.horizontal)
                
                Spacer()
                
                
            }
        }
    }
    
    var grayLine: some View {
        RoundedRectangle(cornerRadius: 1)
            .frame(width: 73, height: 1.5)
            .foregroundColor(DrawingConstants.textFieldOutlineGray).opacity(0.5)
            
        
    }
    
    var signUpButton: some View {
        
        Button {
            
                
        } label: {
            HStack{
                Spacer()
                Text("Sign up")
                    .padding()
                    .foregroundColor(DrawingConstants.darkRed)
                    .font(.custom("OpenSans-Bold", size: 18))
                Spacer()
                
            }
            .background(RoundedRectangle(cornerRadius: 5).stroke(DrawingConstants.darkRed, lineWidth: 5))
            .cornerRadius(5)
            .padding()
        }

        
    }
    
    var signInButton: some View {
        
        Button {
            
            if phoneNum.elementsEqual(AccountDetails.phone)  && password.elementsEqual(AccountDetails.password) {
                
                self.didCompleteLoginProcess()
                
            }
            
        } label: {
            
            HStack{
                Spacer()
                Text("Sign In")
                    .padding()
                    .foregroundColor(.white)
                    .font(.custom("OpenSans-Bold", size: 18))
                Spacer()
                
            }
            .background(DrawingConstants.redLinearGradient)
            .cornerRadius(5)
            .padding()
        }

        
    }
    
    var forgotPasswordButton: some View {
        Button {
            
        } label: {
            
            Text("Forgot Password?")
                .font(.custom("OpenSans-Regular", size: 16))
                .foregroundColor(DrawingConstants.darkRed)
            
        }
        
    }
    
    var phoneNumInputView: some View {
        HStack{
            Image("phone")
                .padding()
            
            TextField("Phone Number", text: $phoneNum)
                .padding()
                .background(DrawingConstants.textFieldGray)
                .foregroundColor(DrawingConstants.textFieldOutlineGray)
        }
        .modifier(customViewModifier(roundedCornes: 5, startColor: .orange, endColor: .purple, textColor: .white))
        .padding(.horizontal)
    }
    
    var passwordInputView: some View {
        HStack{
            Image("lock")
                .padding()
            
            TextField("Password", text: $password)
                .padding()
                .background(DrawingConstants.textFieldGray)
                .foregroundColor(DrawingConstants.textFieldOutlineGray)
            
        }
        .modifier(customViewModifier(roundedCornes: 5, startColor: .orange, endColor: .purple, textColor: .white))
        .padding()
    }
}

struct customViewModifier: ViewModifier {
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .background(DrawingConstants.textFieldIconGray)
            .cornerRadius(roundedCornes)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCornes)
                        .stroke(DrawingConstants.textFieldOutlineGray, lineWidth: 0.3))
        
            .font(.custom("OpenSans-Regular", size: 18))
            
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView{
            
        }
    }
}
