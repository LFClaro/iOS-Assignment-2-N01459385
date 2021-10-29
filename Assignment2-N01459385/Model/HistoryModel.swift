//
//  HistoryModel.swift
//  Assignment2-N01459385
//
//  Created by Luiz Fernando Reis on 2021-10-26.
//

import Foundation

class History {
    var name : String
    var quantity : Int
    var totalPrice : Double
    var purchaseDate : Date
    
    init (n: String, q: Int, p: Double, d: Date){
        name = n
        quantity = q
        totalPrice = p
        purchaseDate = d
    }
    
    init(){
        let now = Date()
        
        name = ""
        quantity = 0
        totalPrice = 0
        purchaseDate = now
    }
    
}
