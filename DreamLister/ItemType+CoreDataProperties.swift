//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by Son Ho on 5/24/18.
//  Copyright © 2018 Son Ho. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
