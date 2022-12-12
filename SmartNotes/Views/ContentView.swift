//
//  ContentView.swift
//  SmartNotes
//
//  Created by Nick Semin on 19.06.2022.
//

import SwiftUI

struct ContentView: View {
    private var auth = AuthController()
    @ObservedObject var authStatus: AuthStatus
    
    init() {
        self.authStatus = auth.authStatus
    }
    
    var body: some View {
        if authStatus.reponse {
            UnlockedView(isUnlocked: $authStatus.reponse)
        } else {
            Button {
                auth.authenticate()
            } label: {
                HStack {
                    Label("Unlock", systemImage: auth.unlockImage)
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
