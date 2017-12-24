//
//  SettingsViewController.swift
//  tip calc
//
//  Created by David Medina on 12/22/17.
//  Copyright © 2017 David Medina. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var percentChoice: UISegmentedControl!
    @IBOutlet weak var modeChoice: UISegmentedControl!
    @IBOutlet weak var percentLabel: UITextField!
    @IBOutlet weak var modeLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // set the default mode colors.
        let defaults = UserDefaults.standard
        let mode = defaults.string(forKey: "mode") ?? "Light"
        let percentIdx = defaults.integer(forKey: "percent")
        setModeColors(mode)
        percentChoice.selectedSegmentIndex = percentIdx
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func savePercent(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(percentChoice.selectedSegmentIndex, forKey: "percent")
        defaults.synchronize()
    }
    
    @IBAction func saveMode(_ sender: Any) {
        let defaults = UserDefaults.standard
        let newMode = getSelectedMode()
        defaults.set(newMode, forKey: "mode")
        defaults.synchronize()
    }
    
    func getSelectedMode() -> String{
        return modeChoice.titleForSegment(at: modeChoice.selectedSegmentIndex)!
    }
    
    func setModeColors(_ mode: String){
        let primaryColor : UIColor
        let subColor : UIColor
        if (mode == "Light"){
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
        percentLabel.textColor = primaryColor
        modeLabel.textColor = primaryColor
        percentLabel.layer.borderColor = primaryColor.cgColor
        modeLabel.layer.borderColor = primaryColor.cgColor
        modeLabel.layer.borderWidth = 1.0
        percentLabel.layer.borderWidth = 1.0
        percentChoice.tintColor = primaryColor
        percentChoice.backgroundColor = subColor
        modeChoice.tintColor = primaryColor
        modeChoice.backgroundColor = subColor
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
