//
//  Naptimer.swift
//  NapTime
//
//  Created by Ian Hall on 8/6/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import Foundation

protocol NapTimerDelegate: class {
    func timerCompleted()
    func timerStopped()
    func timerSecondTicked()
}

class NapTimer{
    
    var timeLeft: TimeInterval?
    
    private var timer: Timer?
    
    weak var delegate: NapTimerDelegate?
    
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
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                self.secondTicked()
            })
        }
    }
    
    func stopTimer(){
        timeLeft = nil
        timer?.invalidate()
        print("stopped Timer")
        delegate?.timerStopped()
        
    }
    
    func timeLeftAsString() -> String {
        let timeRemaining = Int(timeLeft ?? 3 * 60)
        let minsRemaining = timeRemaining / 60
        let secondsRemaining = timeRemaining - (minsRemaining * 60)
        return String(format: "%02d : %02d", arguments: [minsRemaining, secondsRemaining])
    }
    
    
    //MARK: Private
    private func secondTicked() {
        guard let timeLeft = timeLeft else {return}
        if timeLeft > 0 {
            self.timeLeft = timeLeft - 1
            print(timeLeftAsString())
            delegate?.timerSecondTicked()
        } else {
            stopTimer()
            delegate?.timerCompleted()
        }
    }
    
    
}
