//
//  test.swift
//  DTSApp
//
//  Created by Macbook on 19/05/2023.
//

import SwiftUI

struct AccordionItem: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    var isExpanded: Bool = false
}

struct AccordionView: View {
    @State private var accordionItems = [
        AccordionItem(title: "Item 1", content: "Content 1"),
        AccordionItem(title: "Item 2", content: "Content 2"),
        AccordionItem(title: "Item 3", content: "Content 3")
    ]
    
    var body: some View {
        List {
            ForEach(accordionItems) { item in
                Section(header: Text(item.title).font(.headline)) {
                    if item.isExpanded {
                        Text(item.content)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    toggleItem(item)
                }
            }
        }
    
    }
    
    private func toggleItem(_ item: AccordionItem) {
        if let index = accordionItems.firstIndex(where: { $0.id == item.id }) {
            accordionItems[index].isExpanded.toggle()
        }
    }
}

struct test: View {
    var body: some View {
           NavigationView {
               AccordionView()
                   .navigationTitle("Accordion")
           }
       }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
