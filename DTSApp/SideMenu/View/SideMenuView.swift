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
                    .font(.custom("Poppins", size: 10))
                    .fontWeight(.semibold)
                Divider()
                    .frame(height: 1)
                    .shadow(color: Color.theme.ctGray.opacity(0.2), radius: 2, y: 2)
                    .padding(.top)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("All Applications")
                        .font(.custom("Poppins", size: 17))
                        .fontWeight(.semibold)
                        .padding(.horizontal, 30)
                        .padding(.bottom)
                    
                    NavigationLink(
                        destination: PendingView(),
                        label: {
                            HStack {
                                Image("pending-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 16)
                                Text("Pending")
                                    .font(.custom("Poppins", size: 18))
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
                                Image("inspected-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 16)
                                Text("Inspeted")
                                    .font(.custom("Poppins", size: 18))
                                    .foregroundColor(Color.theme.smtFont)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.horizontal)
                        })
                    
                    NavigationLink(
                        destination: PendingView(),
                        label: {
                            HStack {
                                Image("recommended-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 16)
                                Text("Recommended")
                                    .font(.custom("Poppins", size: 18))
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
                                Image("not-recommended-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 16)
                                Text("Not Recommended")
                                    .font(.custom("Poppins", size: 18))
                                    .foregroundColor(Color.theme.smtFont)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.horizontal)
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
