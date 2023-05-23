//
//  Login.swift
//  DTSApp
//
//  Created by Macbook on 15/05/2023.
//

import SwiftUI

struct Login: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView {
            VStack{
                Text("Directorate of Tourism Services Khyber Pakhtunkhwa")
                    .multilineTextAlignment(.center)
                
                
                VStack{
                    Text("Login")
                        .font(.title).bold()
                        .foregroundColor(.green)
                    
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: UIScreen.main.bounds.width * 0.5 ,height: 7)
                    
                    
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
                        destination: PendingView(),
                        label: {
                                Text("LOGIN")
                                    .font(.title2)
                                    .foregroundColor(.white)
                        })
                        .frame(width: UIScreen.main.bounds.width - 60, height: 60)
                        .background(Color.green)
                        .cornerRadius(5)
                }
                .padding(.top, 40)
                
                
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
