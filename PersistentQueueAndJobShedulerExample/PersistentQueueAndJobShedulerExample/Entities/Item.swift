//
//  Item.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation

final class Item {
    let id:UUID
    var name:String
    
    init(name:String) {
        self.id = UUID()
        self.name = name
    }
    
    init(id:UUID, name:String) {
        self.id = id
        self.name = name
    }
}
