//
//  ChartData.swift
//  DTSApp
//
//  Created by Apple on 01/07/2023.
//

import Charts
import Foundation

struct ChartData {
    var year: Int
    var month: Double
    var quantity: Double
    
    static func dataEntriesForYear(_ year: Int, transactions: [ChartData]) -> [PieChartDataEntry] {
        let yearTransactions = transactions.filter{$0.year == year}
        return yearTransactions.map{PieChartDataEntry(value: $0.month, data: $0.quantity)}
    }
    
    static var allData:[ChartData] {
        [
            ChartData(year: 2019, month: 0, quantity: 18),
            ChartData(year: 2019, month: 1, quantity: 98),
            ChartData(year: 2019, month: 2, quantity: 28),
            ChartData(year: 2022, month: 3, quantity: 89),
            ChartData(year: 2022, month: 4, quantity: 28),
            ChartData(year: 2023, month: 5, quantity: 10)
        ]
        
    }
}
