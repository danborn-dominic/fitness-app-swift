//
//  Exercise+CoreDataProperties.swift
//  Fitness App
//
//  Created by Dominic Danborn on 1/7/23.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var name: String?
    @NSManaged public var numWorkingSets: Int64
    @NSManaged public var workout: Workout?
    @NSManaged public var sets: NSSet?

}

// MARK: Generated accessors for sets
extension Exercise {

    @objc(addSetsObject:)
    @NSManaged public func addToSets(_ value: Set)

    @objc(removeSetsObject:)
    @NSManaged public func removeFromSets(_ value: Set)

    @objc(addSets:)
    @NSManaged public func addToSets(_ values: NSSet)

    @objc(removeSets:)
    @NSManaged public func removeFromSets(_ values: NSSet)

}

extension Exercise : Identifiable {

}
