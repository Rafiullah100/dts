//
//  HomeMenuBar.swift
//  DTSApp
//
//  Created by Apple on 27/06/2023.
//

import SwiftUI

struct HomeMenuBar: View {
    @State var MenuBarTile = ""
    @Binding var showMenu: Bool
    
    var body: some View {
            ZStack (alignment: .top){
                HStack {
                    Button(action: {
                        withAnimation {
                            showMenu.toggle()
                        }
                    }, label: {
                        Image("menu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 16.8)
                    })
                    Spacer()
                    Text(MenuBarTile)
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.medium)
                    Spacer()
                    Image("notification-icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 24)
                }
                .padding()
                .padding(.top, 40)
                
                if showMenu {
                    ZStack {
                        Color(.black)
                            .opacity(0.25)
                    }
                    .onTapGesture {
//                        withAnimation(.easeInOut) {
                            showMenu = false
//                        }
                    }
                    .ignoresSafeArea()
//                    .zIndex(2)
                }
                
                VStack(alignment: .leading) {
                    SideMenuView()
                        .frame(width: UIScreen.main.bounds.width)
                        .offset(x: showMenu ? 0 : -380)
//                        .background(showMenu ? Color.white : Color.clear)
                        .ignoresSafeArea()
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .navigationBarHidden(true)
    }
}

struct HomeMenuBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenuBar(showMenu: .constant((false)))
    }
}
