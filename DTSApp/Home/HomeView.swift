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
    @State var showMenu = false
    
    var body: some View {
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: spacing),
            count: numberOfRows
        )
        
        ZStack{
            Color.theme.ctGreen
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 0){
                    HStack{
                        Image("menu")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                        
                        Spacer()
                        
                        Image("notification")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                        
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
                            .clipShape(RoundedShape(corners: [.topLeft, .topRight]))
                        VStack{
                            LazyVGrid(columns: columns, spacing: spacing) {
                                ForEach(0 ..< 4) { _ in
                                    Color.theme.ctGray
                                        .frame(height: UIScreen.main.bounds.height * 0.15)
                                        .cornerRadius(10)
                                }
                            }
                            .offset(y: UIScreen.main.bounds.height * -0.06)
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
                                    .background(Color.theme.ctGreen)
                                
                                Spacer()
                                
                                Text("All Applications Summary")
                                    .font(.custom("Poppins", size: 18))
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .background(Color.white)
                            
                            HStack{
                                Image("rectangle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 10, height: 48)
                                    .background(Color.theme.ctGreen)
                                
                                Spacer()
                                
                                Text("Incomplete Applications Summary ")
                                    .font(.custom("Poppins", size: 18))
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .background(Color.white)
                            
                            HStack{
                                Image("rectangle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 10, height: 48)
                                    .background(Color.theme.ctGreen)
                                
                                Spacer()
                                
                                Text("Recieved Applications District Wise")
                                    .font(.custom("Poppins", size: 18))
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .background(Color.white)
                            
                            HStack{
                                Image("rectangle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 10, height: 48)
                                    .background(Color.theme.ctGreen)
                                
                                Spacer()
                                
                                Text("Inspected Applications District Wise")
                                    .font(.custom("Poppins", size: 18))
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .background(Color.white)
                            
                        }
                        .padding()
                        .padding(.top, 40)
                        
                    }
                    .background(Color.theme.ctGray)
                    .clipShape(RoundedShape(corners: [.topLeft, .topRight]))
//                    .offset(y: UIScreen.main.bounds.height * -0.04)
                    .edgesIgnoringSafeArea(.bottom)
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
