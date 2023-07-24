//
//  BussinessScopeView.swift
//  DTSApp
//
//  Created by Apple on 20/06/2023.
//

import SwiftUI

struct BusinessScopeView: View {
    @State private var isExpanded: Bool = false
    @State private var BussinesScope: BussinessScopeModel?
    @State private var branch: [BussinessScopeBranch]?
    @State private var branchGuarantee: [BussinessScopeBranchguarantee]?
    @State private var main: [BussinessScopeMain]?
    @State private var mainGuarantee: [BussinessScopeMainguarantee]?
    @State var businessID: String


    let businessAccordionTitle = BusinessScopeViewModel.businessAccordionTitle
    let businessAccordionDetails = BusinessAccordionViewModel.businessAccordionDetails

    var body: some View {
        VStack(spacing: 20){
            Data
        }
        .padding(.top)
        
        .onAppear{
            URLSession.shared.request(route: .bussinessScope, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0, "basicInfoID": "Business31828"], model: BussinessScopeModel.self) { result in
                switch result {
                case .success(let info):
                    DispatchQueue.main.async {
                        self.branch = info.branch
                        self.branchGuarantee = info.branchguarantee
                        self.main = info.main
                        self.mainGuarantee = info.mainguarantee
                        print(self.branch ?? [])
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

//struct BusinessScopeView_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessScopeView()
//    }
//}

extension BusinessScopeView{

    
    private var Data: some View {
        VStack(alignment: .center){
            
            if isExpanded {
                HStack(alignment: .top) {
                    Button(action: {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }) {
                        Image(isExpanded ? "drop-up" : "drop-down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 27, height: 27)
                    }
                    .padding(.horizontal, 5)
                    .padding(.top, -8)
                    
                    VStack(alignment: .leading) {
                        Text("Main Office Business Scope")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, -5)
                        VStack {
                            HStack(alignment: .top, spacing: 15) {
//                                    ForEach(businessAccordionDetails) { item in
                                Text("Scope :")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                ForEach(main ?? []) { items in
                                    
                                    BussinessTextView(item: items.scope ?? "")
                                
                                    }
                                
                            }
                            
                            Spacer()
                            
                            HStack(alignment: .top, spacing: 15) {

                                Text("Registration Fee :")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    ForEach(main ?? []) { items in
                                        
                                        BussinessTextView(item: "\(items.renewalFeeForMainOffice ?? 0)")
                                    }
                            }
                            
                            Spacer()
                        }
                        .padding(.top)
                    }
                }
                .padding(.top, 12)
                .padding(.bottom)
                
                HStack(alignment: .top) {
                    Button(action: {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }) {
                        Image(isExpanded ? "drop-up" : "drop-down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 27, height: 27)
                    }
                    .padding(.horizontal, 5)
                    .padding(.top, -8)
                    
                    VStack(alignment: .leading) {
                        Text("Main Guarantee Business Scope")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, -5)
                        VStack {
                            HStack(alignment: .top, spacing: 15) {
//
                                Text("Scope :")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                ForEach(mainGuarantee ?? []) { items in
                                    BussinessTextView(item: items.scope ?? "")
                                    }
                                
                            }
                            
                            Spacer()
                            
                            HStack(alignment: .top, spacing: 15) {
                                
                                Text("Guarantee Fee :")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                
                                
                                    ForEach(mainGuarantee ?? []) { items in
                                        BussinessTextView(item: "\(items.guaranteeFeeForMainOffice ?? 0)")
                                    }
                            }
                            
                            Spacer()
                        }
                        .padding(.top)
                    }
                }
                .padding(.top, 12)
                .padding(.bottom)
                
                HStack(alignment: .top) {
                    Button(action: {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }) {
                        Image(isExpanded ? "drop-up" : "drop-down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 27, height: 27)
                    }
                    .padding(.horizontal, 5)
                    .padding(.top, -8)
                    
                    VStack(alignment: .leading) {
                        Text("Branch Business Scope")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, -5)
                        VStack {
                            HStack(alignment: .top, spacing: 15) {
//                                    ForEach(businessAccordionDetails) { item in
                                Text("Scope :")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                
                                ForEach(branchGuarantee ?? []) { items in
                                    BussinessTextView(item: items.scope ?? "")
                                }
//                                Text("Head Office Renewal Fee :")
//                                    .font(.footnote)
//                                    .fontWeight(.semibold)
//                                Text("Total Branches :")
//                                    .font(.footnote)
//                                    .fontWeight(.semibold)
//                                Text("Total Fee :")
//                                    .font(.footnote)
//                                    .fontWeight(.semibold)
//                                    }
                            }
                            
                            Spacer()
                            
                            HStack(alignment: .top, spacing: 15) {

                                Text("Head Office Renewal Fee :")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                ForEach(branchGuarantee ?? []) { items in
                                    BussinessTextView(item: "\(items.guaranteeFeeForBranchOffice ?? 0)")
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.top)
                    }
                }
                .padding(.top, 12)
                .padding(.bottom)
                
                HStack(alignment: .top) {
                    Button(action: {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }) {
                        Image(isExpanded ? "drop-up" : "drop-down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 27, height: 27)
                    }
                    .padding(.horizontal, 5)
                    .padding(.top, -8)
                    
                    VStack(alignment: .leading) {
                        Text("Guarantee Business Scope")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, -5)
                        VStack(alignment: .leading) {
                            HStack(alignment: .top,spacing: 15) {
//                                    ForEach(businessAccordionDetails) { item in
                                Text("Scope :")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                    .frame(width: 100, alignment: .leading)

                                ForEach(branch ?? []) { items in
                                    BussinessTextView(item: items.scope ?? "")
                                    }
                            }
                            
//                            Spacer()
                            
                            HStack(spacing: 15) {
                                Text("Guarantee Fee :")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .frame(width: 100, alignment: .leading)

                                ForEach(branch ?? []) { items in
                                    BussinessTextView(item: "\(items.licenseFeeForBranchOffice ?? 0)")
//                                    Text(item.totalBranches ?? "")
//                                        .foregroundColor(Color.theme.lgtFont)
//                                        .font(.footnote)
//                                        .fontWeight(.regular)
//                                    Text(item.totalAmount ?? "")
//                                        .foregroundColor(Color.theme.lgtFont)
//                                        .font(.footnote)
//                                        .fontWeight(.regular)
                                    
                                    
                                }
                            }
                            
//                            Spacer()
                        }
                        .padding(.top)
                    }
                }
                .padding(.top, 12)
                .padding(.bottom)

                Spacer()
            }else {
                VStack{
                    HStack(alignment: .center){
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }, label: {
                            Image(isExpanded ?  "drop-up" : "drop-down" )
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                        })
                        Text("Main Office Business Scope")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                    }
                    
                }
                .padding(5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.theme.ctGray)
                .cornerRadius(5)
                
                VStack{
                    HStack(alignment: .center){
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }, label: {
                            Image(isExpanded ?  "drop-up" : "drop-down" )
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                        })
                        Text("Main Guarantee Business Scope")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                    }
                    
                }
                .padding(5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.theme.ctGray)
                .cornerRadius(5)
                
                VStack{
                    HStack(alignment: .center){
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }, label: {
                            Image(isExpanded ?  "drop-up" : "drop-down" )
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                        })
                        Text("Branch Business Scope")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                    }
                    
                }
                .padding(5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.theme.ctGray)
                .cornerRadius(5)
                
                VStack{
                    HStack(alignment: .center){
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }, label: {
                            Image(isExpanded ?  "drop-up" : "drop-down" )
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                        })
                        Text("Guarantee Business Scope")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                    }
                    
                }
                .padding(5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.theme.ctGray)
                .cornerRadius(5)
            }
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
        .background(isExpanded ? Color.theme.ctGray : Color.white)
        .cornerRadius(5)
        .padding(.horizontal)    }
}

struct BussinessTextView: View {
    let item: String

    var body: some View {
        Text(item)
            .foregroundColor(Color.theme.lgtFont)
            .font(.footnote)
            .fontWeight(.regular)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
