//
//  DisplayView.swift
//  DTSApp
//
//  Created by MacBook Pro on 8/16/23.
//

import Foundation

import SwiftUI
import SDWebImageSwiftUI
struct DisplayView: View {
    @State var url: String

    var body: some View {
        VStack{
            WebImage(url: URL(string: "http://175.107.63.137/" + url))
                .resizable()
                .placeholder {
                    ProgressView() // Show a loading indicator while the image is being fetched
                }
                .aspectRatio(contentMode: .fit)
        }
        .padding()

    }
}
