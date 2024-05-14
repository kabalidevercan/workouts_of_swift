//
//  Araba.swift
//  mvvmtry
//
//  Created by Ercan Kabali on 14.05.2024.
//

import Foundation



@Observable
class Araba{
    var marka:String
    var model:String
    var modelYili:String
    var isSuv:Bool
    
    
    init(marka: String,modelYili:String,model:String, isSuv: Bool) {
        self.marka = marka
        self.modelYili = modelYili
        self.isSuv = isSuv
        self.model = model
    }
}
