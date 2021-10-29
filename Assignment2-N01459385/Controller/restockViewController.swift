//
//  restockViewController.swift
//  Assignment2-N01459385
//
//  Created by Luiz Fernando Reis on 2021-10-24.
//

import UIKit

class restockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    var productList : ProductManager?
    var myProduct : Product = Product()
    
    @IBOutlet weak var qtyEntry: UITextField!
    @IBOutlet weak var restockButton: myCustomButton!
    @IBOutlet weak var cancelButton: myCustomButton!
    @IBOutlet weak var myRestockTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (productList?.getAllProducts().count)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restockCell", for: indexPath)
        
        cell.textLabel?.text = productList?.getAllProducts()[indexPath.row].name
        cell.detailTextLabel?.text = String(productList?.getAllProducts()[indexPath.row].quantity ?? 0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let productSelected = productList?.getAllProducts()[indexPath.row] {
            myProduct = productSelected
        } else {
            productError()
        }
    }
    
    @IBAction func restockClicked(_ sender: Any) {
        if myProduct.name != "" {
            if let inputQty = Int(qtyEntry.text!) {
                if inputQty > 0 {
                    myProduct.quantity = myProduct.quantity + inputQty
                    restockAlert(q: inputQty, s: myProduct.name)
                    qtyEntry.text = ""
                    myProduct = Product()
                    myRestockTable.reloadData()
                } else {
                    zeroError()
                }
            } else {
                inputError()
            }
        } else {
            productError()
        }
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    func productError(){
        let alert = UIAlertController(title: "Error!", message: "Select and item and provide a quantity to restock", preferredStyle: .alert)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func zeroError(){
        let alert = UIAlertController(title: "Error!", message: "Quantity is zero", preferredStyle: .alert)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func inputError(){
        let alert = UIAlertController(title: "Error!", message: "Please input a valid quantity", preferredStyle: .alert)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func restockAlert(q: Int, s: String){
        let alert = UIAlertController(title: "Restock completed", message: "\(q) \(s) added to stock", preferredStyle: .alert)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}
