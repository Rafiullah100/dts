






import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case pending
    case inspected
    case recommended
    case notRecommended
    
    var title: String {
        switch self {
        case .pending:
            return "Pending"
        case .inspected:
            return "Inspected"
        case .recommended:
            return "Recommended"
        case .notRecommended:
            return "NotRecommended"
        }
    }
    
    var imageName: String {
        switch self {
        case .pending:
            return "pending-icon"
        case .inspected:
            return "inspected-icon"
        case .recommended:
            return "recommended-icon"
        case .notRecommended:
            return "not-recommended-icon"
        }
    }
}
