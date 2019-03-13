//
//  DeleteItemJob.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation
import SwiftQueue

class DeleteItemJob: BaseItemsJob {
     static let type = "\(#file)"
    override func onRun(callback: JobResult) {
        if let item = self.createItem() {
            Api.Items.delete(item: item)
            callback.done(.success)
        } else {
            callback.done(.fail(JobError.onDelete("Can't delete item")))
        }
    }
}
