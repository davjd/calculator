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
    @IBOutlet weak var totalHeader: UILabel!
    @IBOutlet weak var tipHeader: UILabel!
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var midLine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
        
        // set the default mode colors.
        let defaults = UserDefaults.standard
        let modeIdx = defaults.integer(forKey: "mode")
        let percentIdx = defaults.integer(forKey: "percent")
        setModeColors(modeIdx)
        percentChoice.selectedSegmentIndex = percentIdx
        updateCaculation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        updateCaculation()
    }
    
    @IBAction func segmentCalcUpdate(_ sender: Any) {
        updateCaculation()
    }
    func updateCaculation() {
        let bill = Double(billField.text!) ?? 0
        let percent = getSelectedPercent()
        let tip: Double = bill * percent
        let total: Double = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func setModeColors(_ mode: Int){
        let primaryColor : UIColor
        let subColor : UIColor
        if (mode == 0){
            primaryColor = UIColor.black
            subColor = UIColor(red: 0xFF / 0xFF, green: 0xC9 / 0xFF, blue: 0xB0 / 0xFF, alpha: 0xFF / 0xFF)
        }
        else{
            primaryColor = UIColor(red: 0xFF / 0xFF, green: 0xC9 / 0xFF, blue: 0xB0 / 0xFF, alpha: 0xFF / 0xFF)
            subColor = UIColor.black
        }
        setColors(primaryColor, subColor)
    }
    
    func setColors(_ primaryColor: UIColor, _ subColor: UIColor){
        self.view.backgroundColor = subColor
        tipLabel.textColor = subColor
        tipLabel.backgroundColor = primaryColor
        totalLabel.textColor = subColor
        totalLabel.backgroundColor = primaryColor
        billField.textColor = primaryColor
        billField.tintColor = primaryColor
        percentChoice.tintColor = primaryColor
        percentChoice.backgroundColor = subColor
        topLine.backgroundColor = primaryColor
        midLine.backgroundColor = primaryColor
        tipHeader.textColor = primaryColor
        totalHeader.textColor = primaryColor
    }
    
    func parsePercent(_ percent: String) -> Double{
        let start = percent.index(percent.startIndex, offsetBy: 0)
        let end = percent.index(percent.endIndex, offsetBy: -1)
        return (Double(percent[start..<end])! / 100)
    }
    
    func getSelectedPercent() -> Double{
        let percentText = percentChoice.titleForSegment(at: percentChoice.selectedSegmentIndex)!
        return parsePercent(percentText)
    }
}

