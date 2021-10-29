//
//  managerViewController.swift
//  Assignment2-N01459385
//
//  Created by Luiz Fernando Reis on 2021-10-24.
//

import UIKit

class managerViewController: UIViewController {
    var productList : ProductManager?
    var historyList : HistoryManager?
    
    @IBOutlet weak var historyButton: myCustomButton!
    @IBOutlet weak var restockButton: myCustomButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if historyButton == (sender as! myCustomButton) {
            let hVC = segue.destination as? historyTableViewController
            hVC!.historyList = historyList
        } else {
            let rVC = segue.destination as? restockViewController
            rVC!.productList = productList
        }
    }

}
