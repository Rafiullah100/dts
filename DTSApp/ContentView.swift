//
//  ContentView.swift
//  DTSApp
//
//  Created by Macbook on 12/05/2023.
//

import SwiftUI

struct ContentView: View {
//    @Binding var showMenu: Bool
    @State private var showMenu: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
//                Text("asdfadf")
                    SideMenuView()
                        .offset(x: showMenu ? 0 : UIScreen.main.bounds.width)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image("menu-black")
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Image("search-icon")
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
