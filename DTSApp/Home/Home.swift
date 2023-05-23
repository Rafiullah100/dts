//
//  Home.swift
//  DTSApp
//
//  Created by Macbook on 15/05/2023.
//

import SwiftUI

struct Home: View {
    let spacing : CGFloat = 20
    @State private var numberOfRows = 2
    var body: some View {
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: spacing),
            count: numberOfRows
        )
        
        ZStack{
            Color(.systemGreen)
                .ignoresSafeArea()
            
            ScrollView {
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
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("41")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("Applications")
                            .foregroundColor(.white)
                        
                    }
                        
                    ZStack {
                        Color(.white)
                        VStack{
                                LazyVGrid(columns: columns, spacing: spacing) {
                                    ForEach(0 ..< 4) { _ in
                                        Color.blue
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
                        HStack{
                            Image("rectangle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame( height: 60)
//                                .padding()

                            Spacer()
                            
                            Text("All Applications Summary")
                                .font(.title2)
                                .padding()
                        }
                        .background(Color.gray)
                        .padding()
                    }
                    .background(Color.white)
                }
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
