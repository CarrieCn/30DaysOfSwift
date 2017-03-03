//
//  ViewController.swift
//  SwiftD1StopWatch
//
//  Created by Chen, Carrie on 2/28/17.
//  Copyright © 2017 Chen, Carrie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false

    override func viewDidLoad() {
        timeLabel.text = String(counter)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func resetButtonDidTouch(sender: AnyObject) {
        timer.invalidate()
        isPlaying = false
        counter = 0
        timeLabel.text = String(counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
    }
    
    @IBAction func playButtonDidTouch(sender: AnyObject) {
        if(isPlaying) {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block:{_ in
            self.counter = self.counter + 0.1
            self.timeLabel.text = String(format:"%.1f", self.counter)
        })
        isPlaying = true
    }
    
    @IBAction func pauseButtonDidTouch(sender: AnyObject) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

