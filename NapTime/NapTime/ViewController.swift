//
//  ViewController.swift
//  NapTime
//
//  Created by Ian Hall on 8/6/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: outlets
    @IBOutlet weak var buttonLabel: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    //MARK: Properties
    
    var naptimer = NapTimer()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func timerButtonTapped(_ sender: UIButton) {
        if naptimer.isOn{
            naptimer.stopTimer()
        } else {
            naptimer.startTimer(8)
        }
    }
    
    func updateLabelAndButton(){
        timerLabel.text = naptimer.timeLeftAsString()
        
        var buttonTitle = ""
        var buttonColor: UIColor = .white
        
        if naptimer.isOn{
            buttonTitle = "Stop"
            buttonColor = .red
        } else {
            buttonTitle = "start"
            buttonColor = .green
            
        }
        buttonLabel.setTitle(buttonTitle, for: .normal)
        buttonLabel.setTitleColor(buttonColor, for: .normal)
    }
    
}
extension ViewController: NapTimerDelegate{
    func timerCompleted() {
        
    }
    
    func timerStopped() {
        updateLabelAndButton()
    }
    
    func timerSecondTicked() {
        updateLabelAndButton()
    }
    
    
}
