//
//  ViewController.swift
//  TrafficLights
//
//  Created by Eugene St on 03.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var redLIghtView: UIView!
  @IBOutlet var orangeLightView: UIView!
  @IBOutlet var greenLightView: UIView!
  
  @IBOutlet var startButton: UIButton!
  
  var tag = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSettings()
  }

  /// - Summary: create circles if ciew width and height are equal
  private func circleCorners(for view: UIView) {
    
    if view.frame.size.width == view.frame.size.height {
      view.layer.cornerRadius = view.frame.width/2
    }
  }
  
  private func initialSettings() {
    
    // Rounded corners for Start button
    startButton.layer.cornerRadius = 20
    
    // Calling method to create circled views
    circleCorners(for: redLIghtView)
    circleCorners(for: orangeLightView)
    circleCorners(for: greenLightView)
    
    // Settings 0.3 alpha for views
    redLIghtView.alpha = 0.3
    orangeLightView.alpha = 0.3
    greenLightView.alpha = 0.3
    
    
  }
  
  @IBAction func buttonPressed() {
    startButton.setTitle("Next", for: .normal)
    
    switch tag {
    case 1: view.viewWithTag(tag + 2)?.alpha = 0.3; setAlphaAndIncreaseTag()
    case 2: view.viewWithTag(tag - 1)?.alpha = 0.3; setAlphaAndIncreaseTag()
    case 3: view.viewWithTag(tag - 1)?.alpha = 0.3; view.viewWithTag(tag)?.alpha = 1.0; tag = 1
    default: break
    }
    
  }
  
  private func setAlphaAndIncreaseTag() {
    view.viewWithTag(tag)?.alpha = 1.0
    tag += 1
  }

}

