//
//  UploadFilesView.swift
//  DTSApp
//
//  Created by Apple on 20/06/2023.
//

import SwiftUI
//import SDWebImageSwiftUI
struct UploadedFilesView: View {
    let spacing : CGFloat = 20
    @State private var numberOfRows = 2
    @State var businessID: String
    @State var uploadFiles: [String]?

    var body: some View {
        
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: spacing),
            count: numberOfRows
        )
        
        ZStack {
            Color(.white)
            VStack{
                LazyVGrid(columns: columns, spacing: spacing) {
//                    ForEach(0 ..< (uploadFiles?.count ?? 0)) { _ in
//                        Image("randomImage")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: UIScreen.main.bounds.height * 0.20)
//                            .cornerRadius(5)
//                    }
                }
                .padding()
//                .onAppear{
//                    URLSession.shared.request(route: .uploadFile, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0, "basicInfoID": businessID], model: UploadModel.self) { result in
//                        switch result {
//                        case .success(let files):
//                            DispatchQueue.main.async {
//                                uploadFiles?.append(files.uploads.companyRegistrationScan ?? "")
//                            }
//                        case .failure(let error):
//                            print(error)
//                        }
//                    }
//                }
            }
        }
    }
}

//struct UploadedFilesView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadedFilesView()
//    }
//}
