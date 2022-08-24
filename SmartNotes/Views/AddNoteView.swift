//
//  AddNoteView.swift
//  SmartNotes
//
//  Created by Nick Semin on 20.06.2022.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var noteText: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("New note", text: $noteText)
                }
                
                Button("Add note") {
                    let newNote = SmartNote(context: moc)
                    newNote.id = UUID()
                    newNote.noteText = noteText
                    newNote.done = false
                    newNote.date = Date()
                
                    try? moc.save()
                    dismiss()
                }
            }
        }
    }
}

/*struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}*/
