//
//  Set+CoreDataProperties.swift
//  Fitness App
//
//  Created by Dominic Danborn on 1/7/23.
//
//

import Foundation
import CoreData


extension Set {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Set> {
        return NSFetchRequest<Set>(entityName: "Set")
    }

    @NSManaged public var setNumber: Int64
    @NSManaged public var numReps: Int64
    @NSManaged public var isWorkingSet: Bool
    @NSManaged public var weight: Double
    @NSManaged public var exercise: Exercise?

}

extension Set : Identifiable {

}
