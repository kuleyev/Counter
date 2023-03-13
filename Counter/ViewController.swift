//
//  ViewController.swift
//  Counter
//
//  Created by Anastasiya on 12.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    var count: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.lineBreakMode = .byClipping
        counterLabel.text = String(count)
    }

    @IBAction func plusTap(_ sender: Any) {
        count += 1
        counterLabel.text = String(count)
    }
    
    @IBAction func minusTap(_ sender: Any) {
        count = count > 0 ? count-1 : 0
        counterLabel.text = String(count)
    }
    
}

