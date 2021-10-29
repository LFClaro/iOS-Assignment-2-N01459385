//
//  historyDetailViewController.swift
//  Assignment2-N01459385
//
//  Created by Luiz Fernando Reis on 2021-10-27.
//

import UIKit

class historyDetailViewController: UIViewController {
    @IBOutlet weak var detailLabel: UILabel!
    
    var historyDetail : History?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let historyUnwrapped = historyDetail {
            self.title = historyUnwrapped.name
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy HH:mm:ss a"

            detailLabel.text = ("Item Name: \(historyUnwrapped.name)\nQty Purchased: \(historyUnwrapped.quantity)\nTotal Price: \(String(format: "$ %.2f", historyUnwrapped.totalPrice))\nDate: \(formatter.string(from: historyUnwrapped.purchaseDate))")
        }
    }

}
