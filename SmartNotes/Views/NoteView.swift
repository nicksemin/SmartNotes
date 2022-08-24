//
//  NoteView.swift
//  SmartNotes
//
//  Created by Nick Semin on 19.06.2022.
//

import SwiftUI

struct NoteView: View {
    @ObservedObject
    var note: SmartNote
    
    var body: some View {
        ZStack {
            if note.done {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 2)
            }
            
            HStack {
                Text(note.noteText ?? "Note was empty")
                    .padding()
                
                Spacer()
                
                CheckBox(note: note)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .opacity(note.done ? 0.5 : 1)
        }
    }
}

/*struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(note: Binding<Note(id: UUID(), noteText: "Simple sample text")>)
    }
}*/
