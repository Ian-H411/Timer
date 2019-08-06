//
//  ViewController.swift
//  NapTime
//
//  Created by Ian Hall on 8/6/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    //MARK: outlets
    @IBOutlet weak var buttonLabel: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    //MARK: Properties
    
    var naptimer = NapTimer()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        naptimer.delegate = self
        
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
    
    func presentAlert(){
        let alertController = UIAlertController(title: "TIME'S UP", message: "Do you want to keep sleeping?", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.keyboardType = .numberPad
            textField.placeholder = "how many more seconds of sleep"
        }
        let dismissAction = UIAlertAction(title: "im awake", style: .default, handler: nil)
        
        let snoozeAction = UIAlertAction(title: "Snooze", style: .default) { (_) in
            if let textField = alertController.textFields?.first,
                let inputText = textField.text, let textAsDouble = Double(inputText){
                self.naptimer.startTimer(textAsDouble)
                self.scheduleLocalAlert(in: textAsDouble)
            }
        }
        alertController.addAction(dismissAction)
        alertController.addAction(snoozeAction)
        present(alertController,animated: true)
    }
        func scheduleLocalAlert(in timeInterval: TimeInterval) {
            let content = UNMutableNotificationContent()
            content.title = "times up"
            content.body = "all of your time ran out"
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
            
            
            let request = UNNotificationRequest(identifier: "Naptimer", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { (error) in
                if let error = error{
                    print("notification Failed")
                    print(error.localizedDescription)
                    print(error)
                }
            }
        }
    }

extension ViewController: NapTimerDelegate{
    func timerCompleted() {
        presentAlert()
    }
    
    func timerStopped() {
        updateLabelAndButton()
    }
    
    func timerSecondTicked() {
        updateLabelAndButton()
    }
    
    
}
