//
//  VideoCell.swift
//  SwiftD3LocalVideo
//
//  Created by Chen, Carrie on 3/4/17.
//  Copyright © 2017 Chen, Carrie. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}

class VideoCell: UITableViewCell {
    @IBOutlet weak var videoScreenshot: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSourceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
