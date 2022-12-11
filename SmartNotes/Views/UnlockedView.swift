//
//  UnlockedView.swift
//  SmartNotes
//
//  Created by Nick Semin on 11.12.2022.
//

import SwiftUI

struct UnlockedView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State var addNew = false
    
    var status = ["Completed", "To-Do"]
    @State private var selectedStatus = "To-Do"
    var howToSort: Bool {
        switch selectedStatus {
        case "Completed":
            return true
        case "To-Do":
            return false
        default:
            return false
        }
    }
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading) {
                Picker("", selection: $selectedStatus) {
                    ForEach(status, id: \.self) {
                        Text($0)
                    }
                }
                .padding()
                
                VStack {
                    FilteredList(sortDescriptors: [SortDescriptor(\SmartNote.done)], howToSort: howToSort){ (note: SmartNote) in
                        NoteView(note: note)
                    }
                }
                
            }
            .navigationTitle("SmartNotes")
            .toolbar {
                ToolbarItem() {
                    Button {
                        addNew = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $addNew) {
                AddNoteView()
            }
        }
    }
}

struct UnlockedView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockedView()
    }
}
