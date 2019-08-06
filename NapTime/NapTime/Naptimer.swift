//
//  Naptimer.swift
//  NapTime
//
//  Created by Ian Hall on 8/6/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import Foundation

class NapTimer{
    
    var timeLeft: TimeInterval?
    
    private var timer: Timer?
    
    var isOn: Bool{
        //if there is not time left set it to false
        return timeLeft == nil ? false : true
    }
    
    //MARK: Public Methods
    
    func startTimer(_ time: TimeInterval){
        if isOn{
            print("timer is already running")
        } else {
            self.timeLeft = time
            self.timer = Timer(timeInterval: 1, repeats: true, block: { (_) in
                self.secondTicked()
            })
        }
    }
    
    func stopTimer(){
        timeLeft = nil
        timer?.invalidate()
        print("stopped Timer")
        
    }
    
    
    //MARK: Private
    private func secondTicked() {
        guard let timeLeft = timeLeft else {return}
        if timeLeft > 0 {
            self.timeLeft = timeLeft - 1
            print(self.timeLeft as Any)
        } else {
            stopTimer()
        }
    }
    
    private func timeLeftAsString() -> String {
        let timeRemaining = Int(timeLeft ?? 3 * 60)
        let minsRemaining = timeRemaining / 60
        let secondsRemaining = timeRemaining - (minsRemaining * 60)
        return String(format: "%02d : %02d", arguments: [minsRemaining, secondsRemaining])
    }
}
