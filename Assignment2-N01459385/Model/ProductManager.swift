//
//  ProductManager.swift
//  Assignment2-N01459385
//
//  Created by Luiz Fernando Reis on 2021-10-23.
//

import Foundation

class ProductManager {
    var products = [Product]()
    
    init(){
        products.append(Product(n:"Pants", q:20, p:50.7))
        products.append(Product(n:"Shoes", q:50, p:90))
        products.append(Product(n:"Hats", q:5, p:20.5))
        products.append(Product(n:"T-Shirts", q:10, p:30.2))
        products.append(Product(n:"Dresses", q:24, p:85.9))
    }
    
    func getAllProducts()->[Product]{
        return products
    }
}
