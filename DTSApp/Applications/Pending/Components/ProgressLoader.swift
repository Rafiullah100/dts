//
//  ProgressView.swift
//  DTSApp
//
//  Created by MacBook Pro on 7/24/23.
//

import SwiftUI

struct ProgressViewLoader: View {
    @State var isLoading = true

    var body: some View {
        Group {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: 50, height: 50)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
        }
        .onAppear {
            isLoading = true
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
