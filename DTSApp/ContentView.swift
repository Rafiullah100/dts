//
//  ContentView.swift
//  DTSApp
//
//  Created by Macbook on 12/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State var showMenu = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack {
                Button(action: {
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                }, label: {
                    Image("menu-black")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 16.8)
                })
                Spacer()
                Image("search-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 21)
            }
            .padding()
            
            PendingView()
                .padding(.top, 50)
            
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            if showMenu {
                SideMenuView()
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .offset(x: showMenu ? 0 : -300, y: 0)
                    .background(showMenu ? Color.white : Color.clear)
                    .ignoresSafeArea() ////
            }
        }
//        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
