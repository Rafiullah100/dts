//
//  SideMenuView.swift
//  DTS App
//
//  Created by Apple  on 23/05/2023.
//

import SwiftUI

struct SideMenuView: View {
    //    @Binding var showMenu: Bool
    @State private var isSwitchOn = false

    
    var body: some View {
        VStack {
//            ScrollView {
                Image("DTS-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 74, height: 76)
                    .padding(.top, 60)
                Text("Directorate of Tourism Services Khyber Pakhtunkhwa")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                Divider()
                .colorInvert()
                    .frame(height: 1)
                    .shadow(color: UIColor.theme.ctGray.opacity(0.2), radius: 2, y: 2)
                    .padding(.top)
            NavigationLink(
                destination: HomeView(),
                label: {
                    HStack {
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundColor(UIColor.theme.smtFont)
                        Text("Home")
                            .font(.body)
                            .foregroundColor(UIColor.theme.smtFont)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                })
            .padding()
            
            Divider()
                .colorInvert()
                .frame(height: 1)
                .shadow(color: UIColor.theme.ctGray.opacity(0.2), radius: 2, y: 2)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("All Applications")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 30)
                        .padding(.bottom)
                        .foregroundColor(.primary)

                    
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
                                    .foregroundColor(UIColor.theme.smtFont)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.horizontal)
                            .background(UIColor.theme.sideMenuOddCellColor)
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
                                    .foregroundColor(UIColor.theme.smtFont)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.horizontal)
//                            .background(UIColor.theme.sideMenuOddCellColor)
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
                                    .foregroundColor(UIColor.theme.smtFont)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.horizontal)
                            .background(UIColor.theme.sideMenuOddCellColor)
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
                                    .foregroundColor(UIColor.theme.smtFont)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.horizontal)
//                            .background(UIColor.theme.sideMenuOddCellColor)
                        })
                    
                }
                .padding(.top)
//            }
            Divider()
                .colorInvert()
                .frame(height: 1)
                .shadow(color: UIColor.theme.ctGray.opacity(0.2), radius: 2, y: 2)
            HStack {
                Image("recommended-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 16)
                Text("Dark Mode")
                    .font(.body)
                    .foregroundColor(UIColor.theme.smtFont)
                if #available(iOS 15.0, *) {
                    Toggle("", isOn: $isSwitchOn)
                        .tint(isSwitchOn ? .black : .white)
                        .onChange(of: isSwitchOn) { newValue in
                            print(newValue)
                            UserDefaults.standard.darkMode = newValue
                                        UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = newValue ? .dark : .light
                                    }
                } else {
                    Toggle("", isOn: $isSwitchOn)
                        .onChange(of: isSwitchOn) { newValue in
                            print(newValue)
                            UserDefaults.standard.darkMode = newValue
                                        UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = newValue ? .dark : .light
                                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.horizontal)
            Spacer()
        }
        .frame(width: getRect().width - 70)
        .frame(maxHeight: .infinity)
        .background(UIColor.theme.ctGray.shadow(radius: 5).ignoresSafeArea(.container, edges: .vertical))
        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear{
            guard let isDarkModeOn = UserDefaults.standard.darkMode else {
                return
            }
            isSwitchOn = isDarkModeOn
        }
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
