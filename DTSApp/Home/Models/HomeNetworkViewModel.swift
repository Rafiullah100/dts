//import Foundation
//
//class HomeNetworkViewModel: ObservableObject {
//    @Published var homeModel: [HomeModel] = []
//
//    func fetch() {
//        guard let url = URL(string: "http://175.107.63.137/api/Apis/GetTotal?Uid=39") else {
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) {[weak self] (data, _, error) in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let response = try JSONDecoder().decode([HomeModel].self, from: data)
//                DispatchQueue.main.async {
//                    self?.homeModel = response
//                    print("THE RESPONSE", response)
//                }
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
//    }
//}
