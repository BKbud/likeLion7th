//
//  GridItemEntity+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by 정보경 on 3/20/25.
//
//

import Foundation
import CoreData


extension GridItemEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GridItemEntity> {
        return NSFetchRequest<GridItemEntity>(entityName: "GridItemEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var attribute: NSObject?

}

extension GridItemEntity : Identifiable {

}
