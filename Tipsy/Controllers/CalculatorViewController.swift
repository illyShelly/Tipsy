//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
  
  var tip: Double = 0.1 // as default heighlighted 10%
  var numberOfSplit: Int = 2 // as default shown number
  var billTotal: Double = 0.0
  var defaultBillTotal = ""
  
  var finalBill = "0.0"
  
  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var zeroPctButton: UIButton!
  @IBOutlet weak var tenPctButton: UIButton!
  @IBOutlet weak var twentyPctButton: UIButton!
  @IBOutlet weak var splitNumberLabel: UILabel!
  
  @IBAction func tipChanged(_ sender: UIButton) {
    //  close keyboard when pressed button with %
    billTextField.endEditing(true)
    
    //    default value of bill total
    var defaultBillTotal = billTextField.text

    //  Deselect all tip buttons via IBOutlets
    zeroPctButton.isSelected = false
    tenPctButton.isSelected = false
    twentyPctButton.isSelected = false
    
    //  Make the button that triggered the IBAction selected.
    sender.isSelected = true
    
    // get info when printed Optional("0%") /Strig?/ -> '!' -> String 0%
    let buttonTitle = sender.currentTitle!
    
    // remove % character from String -> 0% -> 0; 10; 20
    let buttonTitleNoCharacter = buttonTitle.dropLast()
    
    //  String into Double
    let buttonIntoNumber = Double(buttonTitleNoCharacter)!
    
    // Convert into a decimal
    tip = buttonIntoNumber / 100
  }
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    //  splitNumberLabel is String -> sender.value Double -> convert
    splitNumberLabel.text = String(format: "%.0f", sender.value)
    
    // not assign splitNumberLabel.text -> too much data change
    // assign sender.value -> into Int whole number from Double
    numberOfSplit = Int(sender.value)
  }
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    // get value from bill text field -> to String from optional '!'
    // or billTextField.text! (unwrapp) -> nil coalescing
    let bill = billTextField.text ?? "0.0"
    
    //  if filled bill value then calculate the sum
    if bill != "" {
      //  bill is String -> assign into my Double billTotal
      //  or use nil coalescing -> Double(bill) ?? 0.0
      //  Double(bill.replacingOccurrences(of: ",", with: "."))
      billTotal = Double(bill)!
      
      //  numberOfSplit is Int -> Double
      let result = billTotal * (1 + tip) / Double(numberOfSplit)
      
      // show it as string
      let resultTo2Decimal = String(format: "%.2f", result)
      //      print(resultTo2Decimal)
      
      // pass result into declared variable to reach it for segue
      finalBill = resultTo2Decimal
      
      //  perfom seque - sender is CalculatorViewController itself
      self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    //    assign default value into 'bill total text' field
    billTextField.text = defaultBillTotal
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //  check if desired segue is triggered
    if segue.identifier == "goToResult" {
      
      // new VC (ResultsVC) initialiaze when segue is triggered
      let destinationRS = segue.destination as! ResultsViewController
      
      // is Datatype UIViewController as! ResultVC
      // now I can reach property of ResultsVC and pass obj. into new VC
      destinationRS.splitBill = finalBill // in ResultVC -> assign to label.text
      destinationRS.numberOfPeople = numberOfSplit
      destinationRS.tip = Int(tip * 100)
    }
   
  }
  
}
