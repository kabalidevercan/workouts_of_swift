//
//  Order.swift
//  CupcakeCorner
//
//  Created by Ercan Kabali on 5.03.2024.
//


import SwiftUI


@Observable
class Order:Codable{
    
    enum CodingKeys:String,CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _speacialRequestEnabled = "speacialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zip = "zip"
    }
    
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
    
    var hasValidAddress:Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty{
            return  false
        }
        
        return true
    }
    
    
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    
    var cost:Double{
        
        var cost = Double(quantity) * 2
        
        cost += Double(type) / 2
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost 
        
        
        
    }
    
    
    
    
}


