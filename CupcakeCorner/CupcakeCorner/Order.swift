//
//  Order.swift
//  CupcakeCorner
//
//  Created by Ercan Kabali on 5.03.2024.
//


import SwiftUI

@Observable
class Order{
    static let types = ["Vanilla","Strawberry","Chocolate","Rainbows"]
    
    var type = 0
    var quantity = 3
    
    var speacialRequestEnabled = false{
        didSet{
            if speacialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    var name = ""
    var streedAddress = ""
    var city = ""
    var zip = ""
    
}





