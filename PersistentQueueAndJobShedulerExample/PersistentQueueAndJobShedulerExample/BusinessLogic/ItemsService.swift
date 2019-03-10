//
//  ItemsService.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation

class ItemsService {
    
    static var id:Int = 1
    
    static func add(name:String) {
        let item = Item()
        item.id = self.id
        item.name = name
        JobSсheduler.Items.add(item: item)
        JobSсheduler.Items.syncWithServer()
    }
    
    static func update(item:Item){
        JobSсheduler.Items.update(item: item)
        JobSсheduler.Items.syncWithServer()
    }
    
    static func delete(item:Item){
        JobSсheduler.Items.delete(item: item)
        JobSсheduler.Items.syncWithServer()
    }
    
    
    static func get() -> [Item] {
        return Api.Items.list()
    }
}
