//
//  Chart.swift
//  DTSApp
//
//  Created by Apple on 01/07/2023.
//

import SwiftUI
import Charts

struct Chart: UIViewRepresentable {
    var entries: [BarChartDataEntry]

    func makeUIView(context: Context) -> PieChartView {
        let chart = PieChartView()
        chart.data = addData()
        return chart
    }

    func updateUIView(_ uiView: PieChartView, context: Context) {
        uiView.data = addData()
    }

    func addData() -> PieChartData {
        let dataSet = PieChartDataSet(entries: entries)
        dataSet.colors = [.lightGray, .systemOrange, .purple, .gray, .cyan, .red]
        dataSet.label = "My Data"

        let data = PieChartData(dataSets: [dataSet]) // Use the initializer that accepts an array of data sets
        return data
    }

    typealias UIViewType = PieChartView
}
