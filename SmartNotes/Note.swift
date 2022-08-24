//
//  Note.swift
//  SmartNotes
//
//  Created by Nick Semin on 19.06.2022.
//

import Foundation

struct Note: Hashable {
    var id: UUID
    var noteText: String
    var category: String
    var done: Bool
    
    init(id: UUID = UUID(), noteText: String, category: String = "", done: Bool = false) {
        self.id = id
        self.noteText = noteText
        self.category = category
        self.done = done
    }
}
