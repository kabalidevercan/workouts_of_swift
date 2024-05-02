//
//  TouchIdAndFaceId.swift
//  FellowTraveller
//
//  Created by Ercan Kabali on 2.05.2024.
//

import SwiftUI
import LocalAuthentication

struct TouchIdAndFaceId: View {
    
    @State private var isUnlocked = false
    
    var body: some View {
        VStack{
            if isUnlocked {
                Text("Unlocked")
            }else {
                Text("Locked")
            }

        }.onAppear(perform:authenticate)
    }
    
    
    
    func authenticate(){
        let context = LAContext()
        var error:NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason  = "We need to unclok your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){success, authenticationError in
                
                if success {
                    //authenticated successfully
                    isUnlocked = true
                    
                }else {
                    //there was a problem
                }
                
            }
            
        }else {
            //no biometrics
        }
    }
    
}

#Preview {
    TouchIdAndFaceId()
}
