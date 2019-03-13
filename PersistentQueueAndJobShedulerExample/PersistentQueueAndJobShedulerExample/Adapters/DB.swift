//
//  DB.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 11/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation
import RealmSwift

final class DB {
    private static let realm = try! Realm()
    final class Items {
        static func list()->[Item] {
            var result = [Item]()
            let items = DB.realm.objects(Item.self)
            for i in 0..<items.count{
                result.append(items[i])
            }
           return result
        }
        
        static func add(item:Item) {
            try! DB.realm.write {
                DB.realm.add(item, update: true)
            }
        }
        
        static func update(item:Item){
            try! DB.realm.write {
                DB.realm.add(item, update: true)
            }
        }
        
        static func delete(item:Item){
            try! DB.realm.write {
                DB.realm.delete(item)
            }
        }
    }
}
