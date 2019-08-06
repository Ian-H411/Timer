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
        naptimer.startTimer(5)
    }

    @IBAction func timerButtonTapped(_ sender: UIButton) {
    }
    
}
