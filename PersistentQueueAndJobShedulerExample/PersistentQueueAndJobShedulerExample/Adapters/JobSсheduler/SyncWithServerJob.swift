//
//  SyncWithServerJob.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 11/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation
import SwiftQueue

class SyncWithServerJob:BaseItemsJob{
     static let type = "\(#file)"
    override func onRun(callback: JobResult) {
        let serverItems = Api.Items.list()
        let localItems = DB.Items.list()
        let dif = serverItems.filter({ item in !localItems.contains(where: { i in i.id == item.id})})
        for item in dif {
            DB.Items.add(item: item)
        }
    }
}
