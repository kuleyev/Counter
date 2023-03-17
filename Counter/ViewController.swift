//
//  ViewController.swift
//  Counter
//
//  Created by Anastasiya on 12.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    var count: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.lineBreakMode = .byClipping
        counterLabel.text = String(count)
        historyTextView.text = "История изменений"
    }

    @IBAction func plusTap(_ sender: Any) {
        counterLabel.text = String(updateCounter(action: "plus"))
     }
    
    @IBAction func minusTap(_ sender: Any) {
        counterLabel.text = String(updateCounter(action: "minus"))

    }
    
    @IBAction func refreshTap(_ sender: Any) {
        counterLabel.text = String(updateCounter(action:""))
           }
    
    
    func getTime() -> String {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = df.string(from: date)
        return dateString
    }
    
    func updateCounter(action: String?) -> Int {
        switch action {
        case "plus":
            count += 1
            updateHistory(action: "plus")
        case "minus":
            let change: Bool = count > 0 ? true : false
            count = count > 0 ? count - 1 : 0
            change ? updateHistory(action: "minus") : updateHistory(action: "belowZero")
        default:
            count = 0
            updateHistory(action: "")
        }
        return count
        
    }
    
    func updateHistory (action: String) {
        switch action {
        case "plus":
            historyTextView.text += "\n \(getTime()): значение изменено на +1"
            
        case "minus":
            historyTextView.text += "\n \(getTime()): значение изменено на -1"
        case "belowZero":
            historyTextView.text += "\n \(getTime()): попытка уменьшить значение счётчика ниже 0"
        default:
            historyTextView.text += "\n\(getTime()): значение сброшено"
        }
        let range = NSMakeRange(historyTextView.text.count - 1, 0)
        historyTextView.scrollRangeToVisible(range)
    }
    
}

