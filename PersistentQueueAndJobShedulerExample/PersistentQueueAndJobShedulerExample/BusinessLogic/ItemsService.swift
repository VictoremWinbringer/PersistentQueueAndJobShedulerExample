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
    static var localItems = Api.Items.list()
    
    static func add(name:String) {
        let item = Item()
        item.id = self.id
        self.id += 1
        item.name = name
        JobSсheduler.Items.add(item: item)
        localItems.append(item)
    }
    
    static func update(item:Item){
        JobSсheduler.Items.update(item: item)
        if let old = localItems.first(where: { i in i.id == item.id}){
         old.name = item.name
        }
    }
    
    static func delete(item:Item){
        JobSсheduler.Items.delete(item: item)
        localItems.removeAll(where: {i in i.id == item.id})
    }
    
    
    static func get() -> [Item] {
        return localItems
    }
    
    static func syncWithServer(){
        JobSсheduler.waitUntilAllOperationsAreFinished()
        localItems = Api.Items.list()
    }
}
