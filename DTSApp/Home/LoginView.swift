//
//  LoginView.swift
//  DTSApp
//
//  Created by Apple  on 02/06/2023.
//

import SwiftUI



struct LoginView: View {
    @State var email = "ihsankhanchemist@gmail.com"
    @State var password = "pakistan"
    @State private var loginSuccess = false
    @State private var showAlert = false
    @State private var alertmessage = ""
    @State var isHideLoader: Bool = true
    @State var showLoader = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    Image("DTS-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 74, height: 76)
                    Text("Directorate of Tourism Services Khyber Pakhtunkhwa")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)

                    
                    VStack{
                        Text("Login")
                            .font(.custom("Poppins", size: 19))
                            .foregroundColor(.primary)

                            .bold()
                        Rectangle()
                            .foregroundColor(UIColor.theme.ctGreen)
                            .frame(width: UIScreen.main.bounds.width * 0.5 ,height: 4)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                    
                    VStack(spacing: 20){
                        HStack{
                            TextField("Email Address", text: $email)
                                .padding(.horizontal)
                                .foregroundColor(.primary)

                        }
                        .frame(height: 52)
                        .background(UIColor.theme.textFieldBGColor)
                        .cornerRadius(5)
                        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 5)
                        .padding(.horizontal, 30)
                        
                        HStack{
                            SecureField("Password", text: $password)
                                .padding(.horizontal)
                                .foregroundColor(.primary)

                        }
                        .frame(height: 52)
                        .background(UIColor.theme.textFieldBGColor)
                        .cornerRadius(5)
                        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 5)
                        .padding(.horizontal, 30)
                        
                        Button(action: {
                            if email.isEmpty || password.isEmpty{
                                showAlert = true
                                alertmessage = "Enter email and password!"
                            }
                            else{
                                self.showLoader = true
                                    loginUser(parameters: ["Email": email, "Password": password, "Role": 9])
                            }
                        }, label: {
                            Text("LOGIN")
                                .font(.title2)
                                .foregroundColor(.white)
                        })
                        .frame(width: UIScreen.main.bounds.width - 60, height: 60)
                        .background(UIColor.theme.ctGreen)
                        .cornerRadius(5)
                        .disabled(loginSuccess)
                        
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text(""),
                                message: Text(alertmessage),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                        
                        NavigationLink(
                            destination: HomeView(),
                            isActive: $loginSuccess,
                            label: {
                                EmptyView()
                            }
                        )
                        .hidden()
                        Spacer()
                        Divider()
                            .padding(.top, 50)
                            .padding(.horizontal, 40)
                        HStack {
                            Image("copyright-icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 9, height: 9)
                            Text("2018 All Rights Reserved")
                                .font(.custom("Poppins", size: 9))
                                .fontWeight(.light)
                                .foregroundColor(UIColor.theme.smtFont)
                        }
                    }
                    .padding(.top, 40)
                }
                
                .padding(.top, 60)
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
    }
    
    func loginUser(parameters: [String: Any]) {
        URLSession.shared.request(route: .login, method: .post, parameters: parameters, model: LoginModel.self) { result in
            self.showLoader = false
            switch result {
            case .success(let login):
                DispatchQueue.main.async {
                    if login.message == "success"{
                        UserDefaults.standard.departmentID = login.departmentID
                        loginSuccess = true
                    }
                    else{
                        alertmessage = "Wrong email or password"
                        showAlert = true
                        email = ""
                        password = ""
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct LoaderView: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
