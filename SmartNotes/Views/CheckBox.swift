//
//  CheckBox.swift
//  SmartNotes
//
//  Created by Nick Semin on 19.06.2022.
//

import SwiftUI

struct CheckBox: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var note: SmartNote
    
    var body: some View {
        ZStack {
            if note.done {
            Image(systemName: "checkmark")
                .foregroundColor(.blue)
            }
            
            Circle()
                .strokeBorder(.black, lineWidth: 1.5)
                //.background(Circle().fill(done ? .blue : .white))
                .onTapGesture {
                    note.done.toggle()
                    try? moc.save()
                }
                .frame(width: 30, height: 30, alignment: .leading)
        }
    }
}

/*struct CheckBox_Previews: PreviewProvider {
    var truth = true
    static var previews: some View {
        CheckBox()
    }
}*/
