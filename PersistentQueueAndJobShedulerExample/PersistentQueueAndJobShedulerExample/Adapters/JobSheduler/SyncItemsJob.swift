//
//  SyncItemsJob.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation
import SwiftQueue

class SyncItemsJob: BaseItemsJob {
    override func onRun(callback: JobResult) {
        //Do nothing. We don't have server
        Api.Items.synchronize()
        callback.done(.success)
    }
}
