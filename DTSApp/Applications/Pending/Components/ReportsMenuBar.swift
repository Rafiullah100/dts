//
//  ReportsMenuBar.swift
//  DTS
//
//  Created by Apple  on 17/05/2023.
//

import SwiftUI

struct ReportsMenuBar: View {
    @State var MenuBarTile = ""
    @Binding var showMenu: Bool
    
    var body: some View {
//        NavigationView {
            ZStack (alignment: .top){
                HStack {
                    Button(action: {
                        withAnimation {
                            showMenu.toggle()
                        }
                    }, label: {
                        Image("menu-black")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 16.8)
                    })
                    Spacer()
                    Text(MenuBarTile)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)

                    Spacer()
                    Image("search-icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 21)
                }
                .padding()
                
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
//        }
    }
}

struct ReportsMenuBar_Previews: PreviewProvider {
    static var previews: some View {
        ReportsMenuBar(showMenu: .constant((true)))
            .previewLayout(.sizeThatFits)
    }
}
