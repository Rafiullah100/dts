//
//  HomeView.swift
//  DTSApp
//
//  Created by Macbook on 15/05/2023.
//

import SwiftUI

struct HomeView: View {
    let spacing : CGFloat = 20
    @State private var numberOfRows = 2
    
    var body: some View {
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: spacing),
            count: numberOfRows
        )
        
        ZStack{
            Color.theme.ctGreen
                .ignoresSafeArea()
            
            ScrollView {
//                ReportsMenuBar, showMenu: <#Binding<Bool>#>()
                VStack{
                    HStack{
                        Image("menu")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                        
                        Spacer()
                        
                        Image("notification")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                        
                    }
                    .padding()
                    
                    VStack{
                        Text("TOTAL  RECIEVED")
                            .font(.custom("Poppins", size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        Text("41")
                            .font(.custom("Poppins", size: 41))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("Applications")
                            .foregroundColor(.white)
                        
                    }
                        
                    ZStack {
                        Color(.white)
                        VStack{
                                LazyVGrid(columns: columns, spacing: spacing) {
                                    ForEach(0 ..< 4) { _ in
                                        Color.theme.ctGray
                                            .frame(height: UIScreen.main.bounds.height * 0.15)
                                            .cornerRadius(10)
                                    }
                                }
                                .offset(y: UIScreen.main.bounds.height * -0.04)
                                .padding(.horizontal, 30)
                            }
                            
                            .frame(width: UIScreen.main.bounds.width)
                        
                    }
                    .padding(.top, 60)
                    
                    ZStack{
                        VStack(spacing: 14) {
                            HStack{
                                Image("rectangle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 10, height: 48)
    //                                .padding()
                                    .background(Color.theme.ctGreen)

                                Spacer()
                                
                                Text("All Applications Summary")
                                    .font(.title2)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .background(Color.white)
//                            .padding()
                            
                            HStack{
                                Image("rectangle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 10, height: 48)
    //                                .padding()
                                    .background(Color.theme.ctGreen)

                                Spacer()
                                
                                Text("Incomplete Applications Summary ")
                                    .font(.title2)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .background(Color.white)
//                            .padding()
                            
                        }
                        .padding()
                        .padding(.top, 40)
                       
                    }
                    .background(Color.theme.ctGray)
                    .offset(y: UIScreen.main.bounds.height * -0.02)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
