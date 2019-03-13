//
//  Item.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation
import RealmSwift

final class Item:Object {
    @objc dynamic  var id:String = ""
    @objc var name:String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
