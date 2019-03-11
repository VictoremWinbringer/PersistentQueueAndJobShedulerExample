//
//  ItemsService.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation

class ItemsService {
    
    static func add(name:String) {
        let item = Item(name: name)
        JobSсheduler.Items.add(item: item)
        DB.Items.add(item: item)
    }
    
    static func update(item:Item){
        JobSсheduler.Items.update(item: item)
        DB.Items.update(item: item)
    }
    
    static func delete(item:Item){
        JobSсheduler.Items.delete(item: item)
        DB.Items.delete(id: item.id)
    }
    
    static func get() -> [Item] {
        JobSсheduler.Items.syncWithServer()
        return DB.Items.list()
    }
}
