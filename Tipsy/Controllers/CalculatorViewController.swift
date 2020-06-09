//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
  
  var tip = 0.1 // as default heighlighted 10%
  
  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var zeroPctButton: UIButton!
  @IBOutlet weak var tenPctButton: UIButton!
  @IBOutlet weak var twentyPctButton: UIButton!
  @IBOutlet weak var splitNumberLabel: UILabel!
  
  @IBAction func tipChanged(_ sender: UIButton) {
    //  Deselect all tip buttons via IBOutlets
    zeroPctButton.isSelected = false
    tenPctButton.isSelected = false
    twentyPctButton.isSelected = false
    
    //  Make the button that triggered the IBAction selected.
    sender.isSelected = true
    
    // get info from pressed button
    let buttonTitle = sender.currentTitle! // printed Optional("0%") /Strig?/ -> '!' -> String 0%
    
    // remove % character from String -> 0% -> 0; 10; 20
    let buttonTitleNoCharacter = buttonTitle.dropLast()
    
    //  String into Double
    let buttonIntoNumber = Double(buttonTitleNoCharacter)!
    
    // Convert into a decimal
    tip = buttonIntoNumber / 100
  }
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
  }
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    //  to get tip from tipChanged assign into declared variable above
    print(tip)
  }
}

