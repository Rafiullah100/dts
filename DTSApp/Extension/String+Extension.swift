//
//  String+Extension.swift
//  Api Task
//
//  Created by Apple  on 12/01/2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
