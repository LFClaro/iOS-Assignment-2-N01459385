//
//  CashierModel.swift
//  Assignment2-N01459385
//
//  Created by Luiz Fernando Reis on 2021-10-24.
//

import Foundation

class CashierModel {
    var quantity : Int
    
    init(){
        quantity = 0
    }
    
    func push (q: Int, p: Double) -> Double{
        quantity = quantity * 10 + q
        return Double(quantity) * p
    }
}
