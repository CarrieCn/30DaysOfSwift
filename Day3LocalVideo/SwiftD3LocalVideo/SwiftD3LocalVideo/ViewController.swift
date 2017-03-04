//
//  ViewController.swift
//  SwiftD3LocalVideo
//
//  Created by Chen, Carrie on 3/4/17.
//  Copyright © 2017 Chen, Carrie. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var videoTableView: UITableView!
    
    var data = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39")
    ]
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoTableView.dataSource = self
        videoTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playVideoButtonDidTouch(sender: AnyObject) {
        let path = Bundle.main.path(forResource: "the croods", ofType: "mp4")
        playerView = AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
        playViewController.player = playerView
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        let video = data[indexPath.row]
        
        cell.videoScreenshot.image = UIImage(imageLiteralResourceName: video.image)
        cell.videoTitleLabel.text = video.title
        
        return cell
    }


}

