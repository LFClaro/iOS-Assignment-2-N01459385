//
//  historyTableViewController.swift
//  Assignment2-N01459385
//
//  Created by Luiz Fernando Reis on 2021-10-24.
//

import UIKit

class historyTableViewController: UITableViewController {
    var historyList : HistoryManager?
    var historyEntry : History = History()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    func emptyError(){
        let alert = UIAlertController(title: "Error!", message: "History is empty", preferredStyle: .alert)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = historyList?.getAllHistory().count
        if Int(rowCount!) > 0  {
            return rowCount!
        } else {
            emptyError()
            return 0
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
        
        cell.textLabel?.text = historyList?.getAllHistory()[indexPath.row].name
        cell.detailTextLabel?.text = String(historyList?.getAllHistory()[indexPath.row].quantity ?? 0)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndex = tableView.indexPath(for: sender as! UITableViewCell)
        let hdVC = segue.destination as? historyDetailViewController
        let now = Date()
        historyEntry = historyList?.getAllHistory()[selectedIndex!.row] ?? History(n: "Dummy entry", q: 0, p: 0, d: now)
        hdVC!.historyDetail = historyEntry
    }
    
}
