//
//  SettingsUI.swift
//  SmartNotes
//
//  Created by Nick Semin on 18.12.2022.
//

import SwiftUI

struct SettingsView: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("Authentication")) {
                Toggle("Use biometrics", isOn: $isOn)
            }
        }
    }
}

struct SettingsUI_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
