//
//  ProductModel.swift
//  Assignment2-N01459385
//
//  Created by Luiz Fernando Reis on 2021-10-23.
//

import Foundation

class Product {
    var name : String
    var quantity : Int
    var price : Double
    
    init (n: String, q: Int, p: Double){
        name = n
        quantity = q
        price = p
    }
    
    init() {
        name = ""
        quantity = 0
        price = 0
    }
}
