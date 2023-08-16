//
//  RecievedAppsView.swift
//  DTSApp
//
//  Created by Apple on 26/06/2023.
//

import SwiftUI

struct RecievedAppsView: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State private var receivedApplication: [Inprocess]?
    @State var showLoader = false

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("home-back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 15, alignment: .center)
                })
                
                Spacer()
                Text("All Received Applications - District Wise")
                    .foregroundColor(.primary)

                Spacer()
                NavigationLink(destination: NotificationView()) {
                    Image("notification")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25.0, height: 25.0)
                }
            }
            .padding()
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(receivedApplication ?? [], id: \.self) { item in
                        Text(item.district)
                            .font(.subheadline)
                            .foregroundColor(.primary)

                            .fontWeight(.medium)
                            .padding(.horizontal)
                            .padding(.top)
                        HStack {
                            ProgressView(value: 0.5)
                                .accentColor(UIColor.theme.ctGreen)
                                .scaleEffect( y: 7.5, anchor: .center)
                                .frame(width: UIScreen.main.bounds.width - 120, height: 15)
                            Spacer()
                            Text("\(item.number)")
                                .foregroundColor(UIColor.theme.ctGreen)
                            Text("(\(item.percentage)%)")
                                .foregroundColor(UIColor.theme.ctGreen)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
                .onAppear {
                    URLSession.shared.request(route: .GetInspectorCompleteChart, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0], model: ChartModel.self) { result in
                        self.showLoader = false
                        switch result {
                        case .success(let application):
                            DispatchQueue.main.async {
                                self.receivedApplication = application.recieved
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
            }
            Spacer()
        }
        .navigationBarHidden(true)
        HStack {
            if showLoader{
                ProgressView()
                    .frame(width:100, height: 100)
                    .foregroundColor(Color(.red))
            }
        }
    }
}

struct RecievedAppsView_Previews: PreviewProvider {
    static var previews: some View {
        RecievedAppsView()
    }
}
