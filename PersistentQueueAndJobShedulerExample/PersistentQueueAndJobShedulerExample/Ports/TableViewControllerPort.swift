//
//  ViewControllerPort.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation

class TableViewControllerPort {
    var items:[Item]{
      return  ItemsService.get()
    }
}
