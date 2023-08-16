//
//  Colors.swift
//  DTSApp
//
//  Created by Macbook on 17/05/2023.
//

import Foundation
import SwiftUI

extension UIColor {
    static let theme = ColorTheme()
    static let uiTheme = UicolorTheme()
}

struct ColorTheme {
    let ctGreen = Color("ctGreen")
    let ctGray = Color("ctGray")
    let smtFont = Color("smtFont")
    let lgtFont = Color("lgtFont")
    let ctLightBlue = Color("ctLightBlue")
    let divider = Color("divider")
    let recieved = Color("received")
    let inspected = Color("inspected")
    let inProgress = Color("inprocess")
    let week = Color("week")
    let overDue = Color("overdue")
    let textFieldBGColor = Color("textFieldBGColor")
    let homeGridContainerBgColor = Color("homeGridContainerBgColor")
    let remarksColor = Color("remarksColor")
    let sideMenuOddCellColor = Color("sideMenuOddCellColor")
    let cardBGView = Color("cardBGView")

    
}

struct UicolorTheme {
    let recieved = UIColor(named:"received")
    let inspected = UIColor(named:"inspected")
    let inProgress = UIColor(named:"inprocess")
    let week = UIColor(named:"week")
    let overDue = UIColor(named:"overdue")
}

extension Color {
    func toUIColor() -> UIColor {
        let uiColor: UIColor = UIColor(self)
        return uiColor
    }
}

enum ButtonType {
    case notification
    case search
}
