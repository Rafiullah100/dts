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
        dataSet.colors = [UIColor(UIColor.theme.recieved), UIColor(UIColor.theme.inspected), UIColor(UIColor.theme.inProgress), UIColor(UIColor.theme.week), UIColor(UIColor.theme.overDue)]

        let data = PieChartData(dataSets: [dataSet]) // Use the initializer that accepts an array of data sets
        return data
    }

    typealias UIViewType = PieChartView
}
