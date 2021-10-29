//
//  ViewController.swift
//  Assignment2-N01459385
//
//  Created by Luiz Fernando Reis on 2021-10-08.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var myProducts : ProductManager = ProductManager()
    var myProduct : Product = Product()
    var myHistory : HistoryManager = HistoryManager()
    var cashier : CashierModel = CashierModel()

    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var itemType: UILabel!
    @IBOutlet weak var itemQty: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        myTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myProducts.getAllProducts().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myCustomTableViewCell
        
        cell.productName?.text = myProducts.getAllProducts()[indexPath.row].name
        cell.productPrice?.text = String(format: "$ %.2f", myProducts.getAllProducts()[indexPath.row].price)
        cell.productQty?.text = String(myProducts.getAllProducts()[indexPath.row].quantity)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myProduct = myProducts.getAllProducts()[indexPath.row]
        itemType.text = "Name: \(myProducts.getAllProducts()[indexPath.row].name)"
        itemPrice.text = String(format: "$ %.2f", myProducts.getAllProducts()[indexPath.row].price)
        itemQty.text = "0"
        cashier.quantity = 0
    }

    @IBAction func numbersClicked(_ sender: UIButton) {
        if let input = Int((sender.titleLabel?.text)!) {
            if Double(itemPrice.text!.dropFirst(2)) != nil {
                itemPrice.text = String(format: "$ %.2f", cashier.push(q: input, p: myProduct.price))
                itemQty.text = String(cashier.quantity)
            } else {
                productError()
            }
        } else {
            productError()
        }
    }
    
    @IBAction func buyClicked(_ sender: Any) {
        if myProduct.name != "" && Double(itemPrice.text!.dropFirst(2)) != nil {
            if let chosenQty = Int(itemQty.text!){
                if chosenQty != 0 {
                    if (myProduct.quantity - chosenQty) >= 0 {
                        myProduct.quantity = myProduct.quantity - chosenQty
                        
                        let myhistoryEntry : History = History()
                        let now = Date()
                        myhistoryEntry.name = myProduct.name
                        myhistoryEntry.quantity = chosenQty
                        myhistoryEntry.totalPrice = Double(itemPrice.text!.dropFirst(2)) ?? 0
                        myhistoryEntry.purchaseDate = now
                        
                        myHistory.addNewHistory(newHistory: myhistoryEntry)
                        
                        purchaseAlert(q: chosenQty, s: myProduct.name)
                        
                        itemType.text = "Item Name"
                        itemQty.text = "Item Quantity"
                        itemPrice.text = "$ 0.00"
                        cashier.quantity = 0
                        myProduct = Product()
                        
                        myTable.reloadData()
                    } else {
                        qtyError()
                    }
                } else {
                    zeroError()
                }
            } else {
                productError()
            }
        } else {
            productError()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mVC = segue.destination as? managerViewController
        mVC!.historyList = myHistory
        mVC!.productList = myProducts
    }
    
    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    func productError(){
        let alert = UIAlertController(title: "Error!", message: "Please select a product", preferredStyle: .alert)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func zeroError(){
        let alert = UIAlertController(title: "Error!", message: "Quantity is zero", preferredStyle: .alert)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func qtyError(){
        let alert = UIAlertController(title: "Error!", message: "Quantity selected exceeds stock", preferredStyle: .alert)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func purchaseAlert(q: Int, s: String){
        let alert = UIAlertController(title: "Purchase completed", message: "\(q) \(s) purchased successfully", preferredStyle: .alert)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}

