//
//  ExerciseForList+CoreDataProperties.swift
//  Fitness App
//
//  Created by Dominic Danborn on 1/10/23.
//
//

import Foundation
import CoreData


extension ExerciseForList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseForList> {
        return NSFetchRequest<ExerciseForList>(entityName: "ExerciseForList")
    }

    @NSManaged public var name: String?

}

extension ExerciseForList : Identifiable {

}
