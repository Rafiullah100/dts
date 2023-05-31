//
//  SideMenuView.swift
//  DTS App
//
//  Created by Apple  on 23/05/2023.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("DTS-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 74, height: 76, alignment: .center)
                    Text("Directorate of Tourism Services Khyber Pakhtunkhwa")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    Divider()
                        .frame(height: 1)
                        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
                        .padding(.top, 14)
                }
                .padding(.top, 50)
                VStack(alignment: .leading, spacing: 0) {
                    Text("Applications")
                        .font(.custom("Poppins", size: 17))
                        .fontWeight(.semibold)
                        .padding()
                    VStack {
                        ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                            if viewModel == .pending {
                                NavigationLink(
                                    destination: PendingView(),
                                    label: {
                                        SideMenuOptionRowView(viewModel: viewModel)
                                    })
                                    .padding()
                            }
                            
                            
                            
    //                        HStack {
    //                            Image("pending-icon")
    //                                .resizable()
    //                                .scaledToFit()
    //                                .frame(width: 15, height: 16)
    //                            Text("Pending")
    //                                .font(.custom("Poppins", size: 18))
    //                                .fontWeight(.regular)
    //                                .foregroundColor(Color.theme.smtFont)
    //                        }
    //                        .padding()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.theme.ctGray)
                    
    //                HStack {
    //                    HStack {
    //                        Image("inspected-icon")
    //                            .resizable()
    //                            .scaledToFit()
    //                            .frame(width: 15, height: 16)
    //                        Text("Inspected")
    //                            .font(.custom("Poppins", size: 18))
    //                            .fontWeight(.regular)
    //                            .foregroundColor(Color.theme.smtFont)
    //                    }
    //                    .padding()
    //                }
    //                .frame(maxWidth: .infinity, alignment: .leading)
    //
    //                HStack {
    //                    HStack {
    //                        Image("recommended-icon")
    //                            .resizable()
    //                            .scaledToFit()
    //                            .frame(width: 15, height: 16)
    //                        Text("Reconmmended")
    //                            .font(.custom("Poppins", size: 18))
    //                            .fontWeight(.regular)
    //                            .foregroundColor(Color.theme.smtFont)
    //                    }
    //                    .padding()
    //                }
    //                .frame(maxWidth: .infinity, alignment: .leading)
    //                .background(Color.theme.ctGray)
    //
    //                HStack {
    //                    HStack {
    //                        Image("not-recommended-icon")
    //                            .resizable()
    //                            .scaledToFit()
    //                            .frame(width: 15, height: 16)
    //                        Text("Not Recommended")
    //                            .font(.custom("Poppins", size: 18))
    //                            .fontWeight(.regular)
    //                            .foregroundColor(Color.theme.smtFont)
    //                    }
    //                    .padding()
    //                }
    //                .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationBarHidden(true)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
