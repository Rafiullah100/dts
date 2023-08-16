//
//  DTSAppApp.swift
//  DTSApp
//
//  Created by Macbook on 12/05/2023.
//

import SwiftUI

@main
struct DTSAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView()
                    .navigationBarHidden(true)
            }
            .onAppear{
                print(UserDefaults.standard.darkMode)
                UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = UserDefaults.standard.darkMode ?? false ? .dark : .light
            }
        }
    }
}
