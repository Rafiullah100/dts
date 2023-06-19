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
                PendingView()
                    .navigationBarHidden(true)
            }
        }
    }
}
