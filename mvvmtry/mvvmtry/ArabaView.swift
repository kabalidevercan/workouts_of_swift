//
//  ArabaView.swift
//  mvvmtry
//
//  Created by Ercan Kabali on 14.05.2024.
//

import SwiftUI

struct ArabaView: View {
    var newAraba:Araba = Araba(marka: "Dacia", modelYili: "2005", model: "Duster", isSuv: true)
    
    
    var body: some View {
        VStack{
            BindableToArabaClass(araba: newAraba)
            Text("Arabanin Markasi: \(newAraba.marka)")
            Text("Arabanin Model Yili: \(newAraba.modelYili)")
            Text("Arabanin Modeli: \(newAraba.model)")
            Text(newAraba.isSuv ? "Suv" : "Ticari")
        }
        
    }
}

#Preview {
    ArabaView()
}


struct BindableToArabaClass: View {
    @Bindable var araba : Araba
    
    
    
    var body: some View {
        Form{
            TextField("Araba Markasi: ", text: $araba.marka)
            TextField("Araba Modeli: ", text: $araba.model)
            TextField("Model Yili: ", text: $araba.modelYili)
            Toggle("Suv mu?",isOn: $araba.isSuv)
            
        }
        
            }
}
