//
//  AuthController.swift
//  SmartNotes
//
//  Created by Nick Semin on 12.12.2022.
//

import Foundation
import LocalAuthentication

class AuthController {
    let laContext = LAContext()
    let defaults = UserDefaults.standard
    var error: NSError?
    var authStatus = AuthStatus(reponse: false)
    
    func authenticate() {
        if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Need access to authenticate"
            
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.authStatus.reponse = success
                    } else {
                        print(error?.localizedDescription ?? "error")
                    }
                }
            }
        } else {
            
        }
    }
    
    func cancelAuthentication() {
        self.laContext.invalidate()
    }
    
    var unlockImage: String {
        laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        if laContext.biometryType == .faceID {
            return "faceid"
        } else {
            return "touchid"
        }
    }

}
