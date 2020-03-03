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
  
  private var tag = 1
  private let lightIsOn: CGFloat = 1
  private let lightIsOff: CGFloat = 0.3
  
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
    redLIghtView.alpha = lightIsOff
    orangeLightView.alpha = lightIsOff
    greenLightView.alpha = lightIsOff
    
  }
  
  @IBAction func buttonPressed() {
    startButton.setTitle("Next", for: .normal)
    
    switch tag {
    case 1: view.viewWithTag(tag + 2)?.alpha = lightIsOff; setAlphaAndIncreaseTag()
    case 2: view.viewWithTag(tag - 1)?.alpha = lightIsOff; setAlphaAndIncreaseTag()
    case 3: view.viewWithTag(tag - 1)?.alpha = lightIsOff; view.viewWithTag(tag)?.alpha = lightIsOn; tag = 1
    default: break
    }
  }
  
  private func setAlphaAndIncreaseTag() {
    view.viewWithTag(tag)?.alpha = lightIsOn
    tag += 1
  }

}

