//
//  Item.swift
//  DreamLister
//
//  Created by Son Ho on 5/24/18.
//  Copyright © 2018 Son Ho. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.createdAt = NSDate()
        
    }
}
