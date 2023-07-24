//
//  UserDefault+Extension.swift
//  DTSApp
//
//  Created by Macbook on 06/07/2023.
//

import Foundation


extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case departmentID
    }
    
    var departmentID: Int? {
        get {
            value(forKey: UserDefaultsKeys.departmentID.rawValue) as? Int
        }
        set{
            set(newValue, forKey: UserDefaultsKeys.departmentID.rawValue)
        }
    }
}

//extension UserDefaults {
//    class func clean() {
//        guard let aValidIdentifier = Bundle.main.bundleIdentifier else { return }
//        standard.removePersistentDomain(forName: aValidIdentifier)
//        standard.synchronize()
//    }
//}
