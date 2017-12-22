//
//  ViewController.swift
//  tip calc
//
//  Created by David Medina on 12/9/17.
//  Copyright © 2017 David Medina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var percentChoice: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UITextField!
    @IBOutlet weak var tipLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let percentText = percentChoice.titleForSegment(at: percentChoice.selectedSegmentIndex)!
        let percent = parsePercent(percentText)
        let tip: Double = bill * percent
        let total: Double = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func parsePercent(_ percent: String) -> Double{
        let start = percent.index(percent.startIndex, offsetBy: 0)
        let end = percent.index(percent.endIndex, offsetBy: -1)
        return (Double(percent[start..<end])! / 100)
    }
}

