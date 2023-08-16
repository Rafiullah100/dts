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
    @State var buttonType: ButtonType?
    var notificationCount: Int
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
                        .foregroundColor(.primary)

                    Spacer()
                    
                    NavigationLink(destination: NotificationView()) {
                        let icon = buttonType == .notification ? "notification-icon" : "search-icon"
                        
                        ZStack(alignment: .topTrailing) {
                            Image(icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25.0, height: 25.0)
                            Text("\(notificationCount ?? 0)")
                                .padding(.horizontal, 3)
                                .font(.footnote)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .offset(x: 5, y: -10)
                        }
                    }
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

//struct HomeMenuBar_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeMenuBar(showMenu: .constant((false)))
//    }
//}
