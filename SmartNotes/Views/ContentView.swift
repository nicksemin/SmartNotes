//
//  ContentView.swift
//  SmartNotes
//
//  Created by Nick Semin on 19.06.2022.
//

import SwiftUI
import Foundation
import LocalAuthentication

struct ContentView: View {
    @State private var isUnlocked: Bool = false
    
    
    func authenticate() {
        var error: NSError?
        let laContext = LAContext()
        
        if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Need access to authenticate"
            
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        isUnlocked = true
                        // failedAuth = ""
                    } else {
                        print(error?.localizedDescription ?? "error")
                        // failedAuth = error?.localizedDescription ?? "error"
                    }
                }
            }
        } else {
            
        }
    }
    
    var unlockImage: String {
        if LAContext().biometryType == .faceID {
            return "faceid"
        } else {
            return "touchid"
        }
    }
    
    var body: some View {
        if isUnlocked {
            UnlockedView()
        } else {
            Button {
                authenticate()
            } label: {
                HStack {
                    Label("Unlock", systemImage: unlockImage)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 33)
                        .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.blue))
                    
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
