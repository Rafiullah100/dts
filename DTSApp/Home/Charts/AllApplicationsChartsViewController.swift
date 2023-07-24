//
//  AllApplicationsChartsViewController.swift
//  DTSApp
//
//  Created by Macbook on 26/06/2023.
//
import Charts
import UIKit

class AllApplicationsChartsViewController: UIViewController, ChartViewDelegate {
    
    var pieChart = PieChartView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        pieChart.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        pieChart.center = view.center
        view.addSubview(pieChart)
        
        var entries = [ChartDataEntry]()
        
        for x in 0..<6 {
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.colorful()
        let data = PieChartData(dataSet: set)
        pieChart.data = data
    }
        
        // Do any additional setup after loading the view.
    }
 

