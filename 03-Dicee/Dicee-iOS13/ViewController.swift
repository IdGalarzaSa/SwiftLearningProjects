//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var diceImageViewOne: UIImageView!
  @IBOutlet var diceImageViewTwo: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func rollButtonPressed(_ sender: Any) {
    let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    diceImageViewOne.image = diceArray.randomElement()
    diceImageViewTwo.image = diceArray.randomElement()
  }
  
}

