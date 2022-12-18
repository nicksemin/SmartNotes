//
//  AuthStatus.swift
//  SmartNotes
//
//  Created by Nick Semin on 12.12.2022.
//

import Foundation

class AuthStatus: ObservableObject {
    @Published var reponse: Bool
    
    init(reponse: Bool) {
        self.reponse = reponse
    }
}
