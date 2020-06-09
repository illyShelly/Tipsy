//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Illy Sell on 08/06/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
  
  //  assign value to show as default
  var splitBill = "0.0" // String?
  var numberOfPeople = 2 // Int?
  var tip: Int?
  
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var settingsLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    totalLabel.text = splitBill
    settingsLabel.text = ("Split between \(numberOfPeople) people, with \(tip!)% tip.")
  }
  
  @IBAction func recalculatePressed(_ sender: UIButton) {
    //  go back to home screen - dismiss actual VC
    self.dismiss(animated: true, completion: nil)
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
