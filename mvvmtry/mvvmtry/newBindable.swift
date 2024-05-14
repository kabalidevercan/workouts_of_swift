//
//  newBindable.swift
//  mvvmtry
//
//  Created by Ercan Kabali on 14.05.2024.
//

import SwiftUI

struct newBindable: View {
    
    
    var getContact = GetContact(name: "Ercan", surname: "Kabali", nickname: "Cogru", password: "ercan123", isHe: true)
    
    var body: some View {
        ContactEditView(getContact: getContact)
        Text(getContact.name)
        Text(getContact.surname)
        Text(getContact.nickname)
        Text(getContact.isHe ? getContact.password :"Sifrenizi gormek icin kadin kullanici ile iletisime gecin")
        
        
    }
}




@Observable
class GetContact {
    
    var name:String
    var surname:String
    var nickname:String
    var password:String
    var isHe:Bool
    
    
    init(name: String, surname: String, nickname: String, password: String,isHe:Bool) {
        self.name = name
        self.surname = surname
        self.nickname = nickname
        self.password = password
        self.isHe = isHe
    }
    
}

struct ContactEditView : View {
    
    @Bindable var getContact : GetContact
    
    var body: some View{
        Form{
            TextField("Name:",text: $getContact.name)
            TextField("Surname:",text: $getContact.surname)
            TextField("Nickname:",text: $getContact.nickname)
            TextField("Password",text: $getContact.password)
            Toggle(isOn: $getContact.isHe, label: {
                Text("Is He?")
            })
        }
        
    }
}

#Preview {
    newBindable()
}
