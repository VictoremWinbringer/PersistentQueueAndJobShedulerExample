//
//  UpdateItemJob.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation
import SwiftQueue

class UpdateItemJob: BaseItemsJob {
    
    override func onRun(callback: JobResult) {
        if let item = self.createItem(),
            item.id > 0 {
            Api.Items.update(item: item)
            callback.done(.success)
        } else {
            callback.done(.fail(JobError.onUpdate("Can't update item")))
        }
    }
}
