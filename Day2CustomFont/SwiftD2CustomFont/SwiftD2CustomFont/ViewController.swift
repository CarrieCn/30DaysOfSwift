//
//  ViewController.swift
//  SwiftD2CustomFont
//
//  Created by Chen, Carrie on 3/4/17.
//  Copyright © 2017 Chen, Carrie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = ["30 Days of Swift", "Fonts:", " - MFJinHei_Noncommercial", " - MFZhiHei_Noncommercial", " - MFTongXin_Noncommercial", "All fonts provided by [造字工房]", "See you ~", "By @CarrieCn"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular"]
    
    var fontRowIndex = 0
    
    @IBOutlet weak var changeFontBtn: UIButton!
    @IBOutlet weak var fontTableView: UITableView!
    
    @IBAction func changeFontDitTouch(sender: AnyObject) {
        fontRowIndex = (fontRowIndex + 1) % 3
        print(fontNames[fontRowIndex])
        fontTableView.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontTableView.dataSource = self
        fontTableView.delegate = self
        
        changeFontBtn.layer.cornerRadius = 70
        fontTableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        let text = data[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name:self.fontNames[fontRowIndex], size:16)
        cell.layer.borderWidth = 0
        if(indexPath.row == 0) {
            cell.textLabel?.textAlignment = NSTextAlignment.center
        }
        if(indexPath.row == data.count - 1) {
            cell.textLabel?.textAlignment = NSTextAlignment.right
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

}

