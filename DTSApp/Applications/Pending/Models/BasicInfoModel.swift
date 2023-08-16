//
//  BasicInfoModel.swift
//  DTSApp
//
//  Created by Macbook on 06/07/2023.
//

import Foundation

// MARK: - Welcome
struct BasicInfoModel: Codable {
    let EmployeeName, businessName, bussinessType, regDateTime, headofficeAddress: String?
    let postalofficeAddress, district, telephoneNumber, emailID: String?
    let website, submittedby, mobileNumber, message: String?

    enum CodingKeys: String, CodingKey {
        case EmployeeName = "Employee_Name"
        case businessName = "BusinessName"
        case bussinessType = "BussinessType"
        case regDateTime = "RegDateTime"
        case headofficeAddress = "HeadofficeAddress"
        case postalofficeAddress
        case district = "District"
        case telephoneNumber = "TelephoneNumber"
        case emailID = "EmailID"
        case website = "Website"
        case submittedby = "Submittedby"
        case mobileNumber = "MobileNumber"
        case message
    }
}



struct ContactInfoModel: Codable {
    let name, designationType, mobileNumber, email: String?
    let whatsApp, skype, facebook, message: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case designationType = "DesignationType"
        case mobileNumber = "MobileNumber"
        case email = "Email"
        case whatsApp = "WhatsApp"
        case skype = "Skype"
        case facebook = "Facebook"
        case message
    }
}

struct LegalInfoModel: Codable {
    let owner: [LegalInfoOwner]
    let legal: LegalInfo?
}

// MARK: - Legal
struct LegalInfo: Codable, Identifiable {
    let id: UUID?
    let companyType, dateRegistration, registrationNo, ntn: String
    let message: String

    enum CodingKeys: String, CodingKey {
        case id =  "UUID"
        case companyType = "CompanyType"
        case dateRegistration = "DateRegistration"
        case registrationNo = "RegistrationNo"
        case ntn = "NTN"
        case message
    }
}

// MARK: - Owner
struct LegalInfoOwner: Codable, Identifiable {
    let id: UUID?
    let ownerShipType, name, employeeType, cnic: String
    let sharePercent: Int
    let contactNo, emailID: String

    enum CodingKeys: String, CodingKey {
        case id =  "UUID"
        case ownerShipType = "OwnerShip_Type"
        case name = "Name"
        case employeeType = "Employee_Type"
        case cnic = "CNIC"
        case sharePercent = "Share_Percent"
        case contactNo = "Contact_No"
        case emailID = "Email_ID"
    }
}


//struct FinancialInfoModel: Codable {
//    let authorizedCapitalRupees: String
//    let totalAsset: Int
//    let name, telephoneNumber, email, website: String
//    let message: String
//
//    enum CodingKeys: String, CodingKey {
//        case authorizedCapitalRupees = "AuthorizedCapitalRupees"
//        case totalAsset = "TotalAsset"
//        case name = "Name"
//        case telephoneNumber = "TelephoneNumber"
//        case email = "Email"
//        case website = "Website"
//        case message
//    }
//}

struct FinancialInfoModel: Codable {
    let financial: FinancialInfo
    let bank: [Bank]
}

// MARK: - Bank
struct Bank: Codable, Identifiable {
    var id: UUID?
        let bankDetailID: Int?
    let bankName, branchCode, accountTitle, accountNumber: String?

    enum CodingKeys: String, CodingKey {
        case id = "UUID"
        case bankDetailID = "Bank_Detail_ID"
        case bankName = "Bank_Name"
        case branchCode = "Branch_Code"
        case accountTitle = "Account_Title"
        case accountNumber = "Account_Number"
    }
}

// MARK: - Financial
struct FinancialInfo: Codable {
    let authorizedCapitalRupees: String
    let totalAsset: Int
    let name, telephoneNumber, email, website: String
    let message: String

    enum CodingKeys: String, CodingKey {
        case authorizedCapitalRupees = "AuthorizedCapitalRupees"
        case totalAsset = "TotalAsset"
        case name = "Name"
        case telephoneNumber = "TelephoneNumber"
        case email = "Email"
        case website = "Website"
        case message
    }
}



struct PendingApplicationsModel: Codable, Identifiable {
    let id: UUID?
    let basicInfoID, businessName, businessType: String?
    let recordID: Int?
    let fileType, fileLocation, inspectionEndDate, remarks: String?

    enum CodingKeys: String, CodingKey {
        case id = "UUID"
        case basicInfoID = "Basic_Info_ID"
        case businessName = "Business_Name"
        case businessType = "BusinessType"
        case recordID = "RecordId"
        case fileType = "File_Type"
        case fileLocation = "File_Location"
        case inspectionEndDate = "InspectionEndDate"
        case remarks = "Remarks"
    }
}


///*******************************

struct RemarksModel: Codable {
    let uploads: RemarksUploads
}

// MARK: - Uploads
struct RemarksUploads: Codable {
    let remarks, inspectionEndDate, message: String?

    enum CodingKeys: String, CodingKey {
        case remarks = "Remarks"
        case inspectionEndDate = "InspectionEndDate"
        case message
    }
}



struct HomeModel: Codable {
    let totalInspectionAssinged, completed, inCompleted, nextWeekComplete: Int?
    let lateApplications: Int?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case totalInspectionAssinged = "TotalInspectionAssinged"
        case completed = "Completed"
        case inCompleted = "InCompleted"
        case nextWeekComplete = "NextWeekComplete"
        case lateApplications = "LateApplications"
        case message
    }
}

struct UploadModel: Codable {
    let uploads: Uploads
}

// MARK: - Uploads
struct Uploads: Codable {
    let filesID: Int?
    let basicID, companyRegistrationScan: String?
    let ownerCNIC, bankCertifacate, ownerDocuments, feeDeposite: String?
    let guaranteeBankSlip, incorporationCertificate, formA, form29: String?
    let directorsCNIC, partnershipFormCertifacate, partnerCNIC: String?
    let message: String

    enum CodingKeys: String, CodingKey {
        case filesID = "FilesID"
        case basicID = "BasicID"
        case companyRegistrationScan = "CompanyRegistrationScan"
        case ownerCNIC = "OwnerCNIC"
        case bankCertifacate = "BankCertifacate"
        case ownerDocuments = "OwnerDocuments"
        case feeDeposite = "FeeDeposite"
        case guaranteeBankSlip = "GuaranteeBankSlip"
        case incorporationCertificate = "IncorporationCertificate"
        case formA = "FormA"
        case form29 = "Form29"
        case directorsCNIC = "DirectorsCNIC"
        case partnershipFormCertifacate = "PartnershipForm_Certifacate"
        case partnerCNIC = "PartnerCNIC"
        case message
    }
}

struct BussinessScopeModel: Codable {
   let message: String?
    let main: [BussinessScopeMain]?
    let branch: [BussinessScopeBranch]?
    let mainguarantee: [BussinessScopeMainguarantee]?
    let branchguarantee: [BussinessScopeBranchguarantee]?
}

// MARK: - Branch
struct BussinessScopeBranch: Codable, Identifiable {
    let id: UUID?
    let scope: String?
    let licenseFeeForBranchOffice: Int?
    let totalBranches, totalAmount: String?

    enum CodingKeys: String, CodingKey {
        case id = "UUID"
        case scope = "Scope"
        case licenseFeeForBranchOffice = "LicenseFeeForBranchOffice"
        case totalBranches = "Total_branches"
        case totalAmount = "Total_Amount"
    }
}

// MARK: - Branchguarantee
struct BussinessScopeBranchguarantee: Codable, Identifiable {
    let id: UUID?
    let scope: String?
    let guaranteeFeeForBranchOffice: Int?
    let totalBranches, totalAmount: String?

    enum CodingKeys: String, CodingKey {
        case id = "UUID"
        case scope = "Scope"
        case guaranteeFeeForBranchOffice = "GuaranteeFeeForBranchOffice"
        case totalBranches = "Total_branches"
        case totalAmount = "Total_Amount"
    }
}

// MARK: - Main
struct BussinessScopeMain: Codable, Identifiable {
    let id: UUID?
    let scope: String?
    let renewalFeeForMainOffice: Int?

    enum CodingKeys: String, CodingKey {
        case id = "UUID"
        case scope = "Scope"
        case renewalFeeForMainOffice = "RenewalFeeForMainOffice"
    }
}

// MARK: - Mainguarantee
struct BussinessScopeMainguarantee: Codable, Identifiable {
    let id: UUID?
    let scope: String?
    let guaranteeFeeForMainOffice: Int?

    enum CodingKeys: String, CodingKey {
        case id = "UUID"
        case scope = "Scope"
        case guaranteeFeeForMainOffice = "GuaranteeFeeForMainOffice"
    }
}


struct InspectedModel: Codable, Hashable {
    let id = UUID()
    let basicInfoID, businessName: String?
    let businessType: String?
    let assignedDate, inspectionEndDate, remarks: String?

    enum CodingKeys: String, CodingKey {
        case id = "UUID"
        case basicInfoID = "Basic_Info_ID"
        case businessName = "Business_Name"
        case businessType = "BusinessType"
        case assignedDate = "AssignedDate"
        case inspectionEndDate = "InspectionEndDate"
        case remarks = "Remarks"
    }
}

struct RecommendedModel: Codable, Hashable, Identifiable {
    let id = UUID()
    let basicInfoID, businessName: String?
    let businessType: String?
    let onDate, remarks: String?

    enum CodingKeys: String, CodingKey {
        case id = "UUID"
        case basicInfoID = "Basic_Info_ID"
        case businessName = "Business_Name"
        case businessType = "BusinessType"
        case onDate = "On_Date"
        case remarks = "Remarks"
    }
}

struct NotRecommendedModel: Codable, Hashable {
    let id = UUID()
    let basicInfoID, businessName: String?
    let businessType: String?
    let onDate, remarks: String?

    enum CodingKeys: String, CodingKey {
        case id = "UUID"
        case basicInfoID = "Basic_Info_ID"
        case businessName = "Business_Name"
        case businessType = "BusinessType"
        case onDate = "On_Date"
        case remarks = "Remarks"
    }
}





struct ChartModel: Codable {
    let recieved, inspected, inprocess: [Inprocess]
    let message: String
}

// MARK: - Inprocess
struct Inprocess: Codable, Hashable {
    let district: String
    let number, percentage: Int

    enum CodingKeys: String, CodingKey {
        case district = "District"
        case number = "Number"
        case percentage = "Percentage"
    }
}


struct NotificationModel: Codable, Hashable {
    let inspectionID: Int?
    let remarks, inspectionEndDate: String?
    let fullName: String?
    let assignedMins: Int?

    enum CodingKeys: String, CodingKey {
        case inspectionID = "InspectionId"
        case remarks = "Remarks"
        case inspectionEndDate = "InspectionEndDate"
        case fullName = "Full_Name"
        case assignedMins = "AssignedMins"
    }
}


struct MakeReportModel: Codable{
    let message: String?
}






struct PhysicalInfoModel: Codable, Identifiable {
    var id: UUID?
    let basic: Basic?
    let vehicle: [Vehicle]?
    let itdevice: [Itdevice]?
    let branch: [Branch]?
    let employee: [Employee]?
}

// MARK: - Basic
struct Basic: Codable {
    let selectOffices: String
    let areaValue: Int
    let areaID: String
    let numberOfOffice: Int
    let message: String

    enum CodingKeys: String, CodingKey {
        case selectOffices = "SelectOffices"
        case areaValue = "AreaValue"
        case areaID = "AreaID"
        case numberOfOffice = "NumberOfOffice"
        case message
    }
}

// MARK: - Branch
struct Branch: Codable, Identifiable {
    let id = UUID()
    let branchName, branchAddress, contactPerson, telephone: String?
    let mobile: String?

    enum CodingKeys: String, CodingKey {
        case id = "UUID"
        case branchName = "Branch_Name"
        case branchAddress = "Branch_Address"
        case contactPerson = "Contact_Person"
        case telephone = "Telephone"
        case mobile = "Mobile"
    }
}

// MARK: - Employee
struct Employee: Codable, Identifiable {
    let id : UUID?
    let employeeName, branchName, designationID, cnic: String?
    let qualifacationID, experienceYear, contactNumber: String?

    enum CodingKeys: String, CodingKey {
        case id = "UUID"
        case employeeName = "Employee_Name"
        case branchName = "Branch_Name"
        case designationID = "Designation_ID"
        case cnic = "CNIC"
        case qualifacationID = "Qualifacation_ID"
        case experienceYear = "Experience_Year"
        case contactNumber = "Contact_Number"
    }
}



// MARK: - Itdevice
struct Itdevice: Codable, Identifiable {
    let id : UUID?
    let numberOfComputers, numberPrinters, dsl: String?

    enum CodingKeys: String, CodingKey {
        case id = "UUID"
        case numberOfComputers = "Number_Of_Computers"
        case numberPrinters = "Number_Printers"
        case dsl = "DSL"
    }
}

// MARK: - Vehicle
struct Vehicle: Codable, Identifiable {
    let id: UUID?
    let vehicleRegNo, modelYear, vehicleTypeID, vehicleNameOwned: String?

    enum CodingKeys: String, CodingKey {
        case id = "UUID"
        case vehicleRegNo = "Vehicle_Reg_No"
        case modelYear = "Model_Year"
        case vehicleTypeID = "Vehicle_Type_ID"
        case vehicleNameOwned = "Vehicle_Name_Owned"
    }
}


struct NotificationCountModel: Codable {
    let notificationCount: Int
    enum CodingKeys: String, CodingKey {
        case notificationCount = "NotificationCount"
    }
}
