//
//  SmartNote+CoreDataProperties.swift
//  SmartNotes
//
//  Created by Nick Semin on 24.07.2022.
//
//

import Foundation
import CoreData


extension SmartNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SmartNote> {
        return NSFetchRequest<SmartNote>(entityName: "SmartNote")
    }

    @NSManaged public var done: Bool
    @NSManaged public var id: UUID?
    @NSManaged public var noteText: String?
    @NSManaged public var date: Date?
    
    public var wrappedNoteText: String {
        noteText ?? "No text"
    }
    
    public var wrappedNoteDate: Date {
        date ?? Date()
    }

}

extension SmartNote : Identifiable {

}
