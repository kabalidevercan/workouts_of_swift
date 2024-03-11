//
//  Page2.swift
//  KitapKurdu
//
//  Created by Ercan Kabali on 11.03.2024.
//

import SwiftUI
import SwiftData


struct Page2: View {
    
    @Query var students:[Student]
    
    
    var body: some View {
        NavigationStack{
            List(students){student in
                Text(student.name)
            }
            .navigationTitle("Class")
        }
    }
}

#Preview {
    Page2()
}
