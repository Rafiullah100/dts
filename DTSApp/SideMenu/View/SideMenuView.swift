//
//  SideMenuView.swift
//  DTS App
//
//  Created by Apple  on 23/05/2023.
//

import SwiftUI

struct SideMenuView: View {
    //    @Binding var showMenu: Bool
   
    
    var body: some View {
        VStack {
//            ScrollView {
                Image("DTS-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 74, height: 76)
                    .padding(.top, 40)
                Text("Directorate of Tourism Services Khyber Pakhtunkhwa")
                    .font(.caption2)
                    .fontWeight(.semibold)
                Divider()
                    .frame(height: 1)
                    .shadow(color: Color.theme.ctGray.opacity(0.2), radius: 2, y: 2)
                    .padding(.top)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("All Applications")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 30)
                        .padding(.bottom)
                    
                    NavigationLink(
                        destination: HomeView(),
                        label: {
                            HStack {
                                Image(systemName: "house")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(Color.theme.smtFont)
                                Text("Home")
                                    .font(.body)
                                    .foregroundColor(Color.theme.smtFont)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.theme.ctGray)
                        })
                    
                    NavigationLink(
                        destination: PendingView(),
                        label: {
                            HStack {
                                Image("pending-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 16)
                                Text("Pending")
                                    .font(.body)
                                    .foregroundColor(Color.theme.smtFont)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.horizontal)
//                            .background(Color.theme.ctGray)
                        })
                    
                    NavigationLink(
                        destination: InspectedData(),
                        label: {
                            HStack {
                                Image("inspected-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 16)
                                Text("Inspeted")
                                    .font(.body)
                                    .foregroundColor(Color.theme.smtFont)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.theme.ctGray)
                        })
                    
                    NavigationLink(
                        destination: RecomendedData(),
                        label: {
                            HStack {
                                Image("recommended-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 16)
                                Text("Recommended")
                                    .font(.body)
                                    .foregroundColor(Color.theme.smtFont)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.horizontal)
//                            .background(Color.theme.ctGray)
                        })
                    
                    NavigationLink(
                        destination: NotRecommendedData(),
                        label: {
                            HStack {
                                Image("not-recommended-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 16)
                                Text("Not Recommended")
                                    .font(.body)
                                    .foregroundColor(Color.theme.smtFont)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.theme.ctGray)
                        })
                    
                }
                .padding(.top)
//            }
            Spacer()
        }
        .frame(width: getRect().width - 70)
        .frame(maxHeight: .infinity)
        .background(Color.white.shadow(radius: 5).ignoresSafeArea(.container, edges: .vertical))
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
