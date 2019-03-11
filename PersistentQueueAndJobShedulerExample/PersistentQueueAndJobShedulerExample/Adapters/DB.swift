//
//  DB.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 11/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation

final class DB {
    final class Items {
        static var items: [Item] = []
        
        static func list()->[Item] {
            return self.items
        }
        
        static func add(item:Item) {
            self.items.append(item)
        }
        
        static func update(item:Item){
            if let old = self.items.first(where: { i in i.id == item.id}) {
                old.name = item.name
            }
        }
        
        static func delete(id:Int){
            self.items.removeAll(where: { i in i.id == id})
        }
    }
}
