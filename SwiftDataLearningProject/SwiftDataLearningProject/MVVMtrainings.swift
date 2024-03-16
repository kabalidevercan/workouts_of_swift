//
//  MVVMtrainings.swift
//  SwiftDataLearningProject
//
//  Created by Ercan Kabali on 16.03.2024.
//

import Foundation
import SwiftUI

@Observable
class AnaSayfaViewModel:Identifiable{
    
     var sonuc = 0
    
    func toplam(number1:Int?,number2:Int?){
        if let sayi1 = number1,let sayi2 = number2{
            sonuc = sayi1 + sayi2
        }
    }
    
    func carp(number1:Int?,number2:Int?){
        if let sayi1 = number1,let sayi2 = number2{
            sonuc = sayi1 * sayi2
        }
    }
}
