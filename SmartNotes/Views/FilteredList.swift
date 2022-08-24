//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Nick Semin on 21.07.2022.
//
import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    let howToSort: Bool
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    /*enum PredicateFormats: NSPredicate {
        
      //  case beginsWith = NSPredicate(format: "%K BEGINSWITH %@", "")
        case isDone = NSPredicate(format: "done == %@", NSNumber(booleanLiteral: true))
    }*/
    
    init(sortDescriptors: [SortDescriptor<T>],  howToSort: Bool, @ViewBuilder content: @escaping (T) -> Content) {
        self.howToSort = howToSort
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "done == %@", NSNumber(booleanLiteral: howToSort)))
        self.content = content
        
    }
}
