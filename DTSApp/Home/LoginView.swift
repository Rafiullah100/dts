//
//  LoginView.swift
//  DTSApp
//
//  Created by Apple  on 02/06/2023.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
        @State var password = ""
        var body: some View {
            NavigationView {
                VStack{
                    Image("DTS-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 74, height: 76)
                    Text("Directorate of Tourism Services Khyber Pakhtunkhwa")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    
                    VStack{
                        Text("Login")
                            .font(.custom("Poppins", size: 19))
                            .bold()
                        
                        Rectangle()
                            .foregroundColor(.green)
                            .frame(width: UIScreen.main.bounds.width * 0.5 ,height: 4)
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                    
                    VStack(spacing: 20){
                        HStack{
                            TextField("Email Address", text: $email)
                                .padding(.horizontal)
                            
                        }
                        .frame(height: 52)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 5)
                        .padding(.horizontal, 30)
                        
                        HStack{
                            TextField("Password", text: $password)
                                .padding(.horizontal)
                            
                        }
                        .frame(height: 52)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 5)
                        .padding(.horizontal, 30)
                        
                        NavigationLink(
                            destination: HomeView(),
                            label: {
                                    Text("LOGIN")
                                        .font(.title2)
                                        .foregroundColor(.white)
                            })
                            .frame(width: UIScreen.main.bounds.width - 60, height: 60)
                            .background(Color.green)
                            .cornerRadius(5)
                        Spacer()
                        Divider()
                            .padding(.top, 50)
                            .padding(.horizontal, 40)
                        HStack {
                            Image("copyright-icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 9, height: 9)
                            Text("2018 All Rights Reserved")
                                .font(.custom("Poppins", size: 9))
                                .fontWeight(.light)
                                .foregroundColor(Color.theme.smtFont)
                        }
                        
                        
                    }
                    .padding(.top, 40)
                    
                    
                }
                .padding(.top, 60)
                .navigationBarHidden(true)
            }
        }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
