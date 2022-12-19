//
//  TabbarView.swift
//  SmartNotes
//
//  Created by Nick Semin on 18.12.2022.
//

import SwiftUI

struct TabbarView: View {
    @Binding var isUnlocked: Bool
    var body: some View {
        TabView {
            UnlockedView(isUnlocked: $isUnlocked)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("To-do list")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(isUnlocked: .constant(true))
    }
}
