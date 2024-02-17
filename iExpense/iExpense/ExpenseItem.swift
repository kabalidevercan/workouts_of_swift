//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ercan Kabali on 14.02.2024.
//

import Foundation


struct ExpenseItem:Identifiable,Codable{
    var id = UUID()
    let name:String
    let type:String
    let amount:Double
}
