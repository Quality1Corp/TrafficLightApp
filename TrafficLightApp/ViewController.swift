//
//  ViewController.swift
//  TrafficLightApp
//
//  Created by MikhaiL on 21.03.2023.
//

import UIKit

enum Color {
    case red, yellow, green
}

final class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var currentLight = Color.red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
    }
    
    override func viewWillLayoutSubviews() {
        roundingTrafficLights()
    }
    
    @IBAction private func switchButton() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        nextColor()
    }
    
    private func nextColor() {
        switch currentLight {
            case .red:
                currentLight = Color.yellow
                redView.alpha = 1.0
                yellowView.alpha = 0.3
                greenView.alpha = 0.3
            case .yellow:
                currentLight = Color.green
                redView.alpha = 0.3
                yellowView.alpha = 1
                greenView.alpha = 0.3
            case .green:
                currentLight = Color.red
                redView.alpha = 0.3
                yellowView.alpha = 0.3
                greenView.alpha = 1
        }
    }
    
    private func roundingTrafficLights() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }
}
