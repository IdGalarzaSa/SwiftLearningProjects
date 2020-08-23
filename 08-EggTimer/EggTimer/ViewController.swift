//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var hardnessProgressBar: UIProgressView!
  
  let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
  var timer = Timer()
  var totalTime = 0
  var secondsPassed = 0
  var player: AVAudioPlayer!
  
  @IBAction func hardnessSelected(_ sender: UIButton) {
    resetDefaultValues()
    let hardness = sender.currentTitle!
    titleLabel.text = "Waiting for a \"\(hardness)\" eggs"
    totalTime = eggTimes[hardness]! * 60
    timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
  }
  
  @objc func updateTimer() {
    if totalTime > secondsPassed {
      let percent = Float(secondsPassed) / Float(totalTime)
      self.hardnessProgressBar.setProgress(percent, animated: true )
      secondsPassed += 1
    } else {
      self.timer.invalidate()
      playSound()
      self.hardnessProgressBar.setProgress(1, animated: true)
      titleLabel.text = "Done!!!"
    }
  }
  
  func resetDefaultValues(){
    timer.invalidate()
    secondsPassed = 0
    hardnessProgressBar.setProgress(0, animated: true)
  }
  
  func playSound() {
    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
  }
}
