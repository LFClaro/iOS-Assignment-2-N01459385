//
//  HistoryManager.swift
//  Assignment2-N01459385
//
//  Created by Luiz Fernando Reis on 2021-10-26.
//

import Foundation

class HistoryManager {
    var history = [History]()
    
    init(){
    }
    
    func addNewHistory(newHistory: History){
        history.append(newHistory)
    }
    
    func getAllHistory()->[History]{
        return history
    }
}
