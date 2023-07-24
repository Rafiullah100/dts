//
//  HomeView.swift
//  DTSApp
//
//  Created by Macbook on 15/05/2023.
//




//
//  HomeView.swift
//  DTSApp
//
//  Created by Macbook on 15/05/2023.
//
import Charts
import SwiftUI
import UIKit

struct HomeView: View {
    let spacing: CGFloat = 20
    @State private var numberOfRows = 2
    @State var showMenu = false
    @State private var homeInfo: HomeModel?
    @State var showLoader = true
    
    init() {
        UIScrollView.appearance().bounces = false
    }

    
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: spacing), count: numberOfRows)
        
        ScrollView {
            ZStack {
                
                Color.theme.ctGreen
                HomeMenuBar(MenuBarTile: "", showMenu: $showMenu)
                    .zIndex(showMenu ? 1 : 0)
                VStack(spacing: 0) {
                    VStack {
                        Text("TOTAL RECEIVED")
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        Text("\(homeInfo?.completed ?? 0)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("Applications")
                            .foregroundColor(.white)
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.17)
                    
                    VStack {
                        LazyVGrid(columns: columns, spacing: spacing) {
                            CardView(title: "INSPECTED", numberOfApplication: homeInfo?.totalInspectionAssinged, description: "Appliations")
                            CardView(title: "IN PROCESS", numberOfApplication: homeInfo?.inCompleted, description: "For Inspection")
                            CardView(title: "THIS WEEK", numberOfApplication: homeInfo?.nextWeekComplete, description: "To Be Inspection")
                            CardView(title: "OVER DUE DATE", numberOfApplication: homeInfo?.lateApplications, description: "Inspections")
                        }
                        .offset(y: UIScreen.main.bounds.height * -0.04)
                        .padding(.horizontal, 30)
                        .onAppear{
                            URLSession.shared.request(route: .home, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0], model: HomeModel.self) { result in
                                self.showLoader = false
                                switch result {
                                case .success(let home):
                                    DispatchQueue.main.async {
                                        self.homeInfo = home
                                    }
                                case .failure(let error):
                                    print(error)
                                }
                            }
                        }
                        
                        LazyVStack(spacing: 14) {
                            ListCardView(title: "All Applications Summary", destination: AnyView(AllAppsView()))
                            ListCardView(title: "Incomplete Applications Summary", destination: AnyView(IncompleteAppsView()))
                            ListCardView(title: "Received Applications District Wise", destination: AnyView(RecievedAppsView()))
                            ListCardView(title: "Inspected Applications District Wise", destination: AnyView(InspectedAppsView()))
                        }
                        .padding()
                        .padding(.top, 40)
                        .padding(.bottom, 20)
                        .background(Color.theme.ctGray.clipShape(RoundedShape(corners: [.topLeft, .topRight])))
                        .frame(maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.bottom)
                    }
                    .background(Color.white.clipShape(RoundedShape(corners: [.topLeft, .topRight])))
                    .padding(.top, 60)
                }
                .padding(.top, 80)
                HStack {
                    if showLoader{
                        ProgressView()
                            .frame(width:100, height: 100)
                            .foregroundColor(Color(.red))
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct ChartsViewRepresentable: UIViewControllerRepresentable{
        
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyBoard = UIStoryboard(name: "AllApplicationsCharts", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "AllApplicationsChartsViewController") as! AllApplicationsChartsViewController
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct CardView: View {
    @State var title: String?
    let numberOfApplication: Int?
    @State var description: String?
    
    var body: some View {
        VStack {
            Text(title ?? "")
                .font(.headline)
                .fontWeight(.medium)
            Text("\(numberOfApplication ?? 0)")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(description ?? "")
        }
        .frame(width: UIScreen.main.bounds.width * 0.42,height: UIScreen.main.bounds.height * 0.15)
        .background(Color.theme.ctGray)
        .cornerRadius(10)
        .onAppear {
            print(numberOfApplication ?? 0)
        }
    }
}

struct ListCardView: View {
    @State var title: String
    let destination: AnyView
    
    var body: some View {
        NavigationLink(
            destination: destination,
            label: {
                HStack {
                    Image("rectangle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 10)
                        .background(Color.theme.ctGreen)
                        .clipShape(RoundedShape(corners: [.topLeft, .bottomLeft]))
                    Spacer()
                    Text(title)
                        .font(.headline)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.black)
                }
                .frame(height: 50)
                .background(Color.white)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
