//
//  UploadFilesView.swift
//  DTSApp
//
//  Created by Apple on 20/06/2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct UploadedFilesView: View {
    let spacing: CGFloat = 20
    @State private var numberOfRows = 2
    @State var businessID: String
    @State var uploadFiles: [String] = []
    @State private var selectedFileIndex: Int? = nil

    var body: some View {
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: spacing),
            count: numberOfRows
        )
        ZStack {
            Color(UIColor.clear)
            VStack {
                LazyVGrid(columns: columns, spacing: spacing) {
                    ForEach(uploadFiles.indices, id: \.self) { index in
                        let url = uploadFiles[index]
                        WebImage(url: URL(string: "http://175.107.63.137/" + url))
                            .resizable()
                            .placeholder {
                                ProgressView() // Show a loading indicator while the image is being fetched
                            }
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.height * 0.20, height: UIScreen.main.bounds.height * 0.20)
                            .cornerRadius(5)
                            .clipped()
                            .border(selectedFileIndex == index ? Color.blue : Color.clear, width: 2) // Add a border to the selected file
                            .onTapGesture {
                                selectedFileIndex = index
                            }
                            .background(
                                NavigationLink(
                                    destination: DisplayView(url: uploadFiles[selectedFileIndex ?? 0]),
                                    isActive: Binding<Bool>(
                                        get: { selectedFileIndex == index },
                                        set: { newValue in
                                            if !newValue {
                                                selectedFileIndex = nil
                                            }
                                        }
                                    ),
                                    label: EmptyView.init
                                )
                            )
                    }
                }
                .padding()
            }
            .onAppear {
                fetchUploadFiles()
            }
        }
    }
    private func fetchUploadFiles() {
        URLSession.shared.request(route: .uploadFile, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0, "basicInfoID": businessID], model: UploadModel.self) { result in
            switch result {
            case .success(let files):
                DispatchQueue.main.async {
                    uploadFiles.append(files.uploads.companyRegistrationScan ?? "")
                    uploadFiles.append(files.uploads.ownerCNIC ?? "")
                    uploadFiles.append(files.uploads.bankCertifacate ?? "")
                    uploadFiles.append(files.uploads.ownerDocuments ?? "")
                    uploadFiles.append(files.uploads.feeDeposite ?? "")
                    uploadFiles.append(files.uploads.guaranteeBankSlip ?? "")
                    uploadFiles.append(files.uploads.incorporationCertificate ?? "")
                    uploadFiles.append(files.uploads.formA ?? "")
                    uploadFiles.append(files.uploads.form29 ?? "")
                    uploadFiles.append(files.uploads.directorsCNIC ?? "")
                    uploadFiles.append(files.uploads.partnershipFormCertifacate ?? "")
                    uploadFiles.append(files.uploads.partnerCNIC ?? "")
                    print(uploadFiles.count)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
