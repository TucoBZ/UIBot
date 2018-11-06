//
//  ButtonLabelViewController.swift
//  UIBot_Example
//
//  Created by Tulio Bazan on 05/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class ButtonLabelViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    var count: Int = 0 {
        didSet {
            countLabel.text = "\(count)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func plusAction(_ sender: Any) {
        count += 1
    }
    
    @IBAction func minusAction(_ sender: Any) {
        count -= 1
    }
}
