//
//  AddItemJob.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation
import SwiftQueue

class AddItemJob: BaseItemsJob {
    
    static let type = "AddItemJob"
    
    override func onRun(callback: JobResult) {
        if let item = self.createItem() {
            Api.Items.add(item: item)
            callback.done(.success)
        } else {
            callback.done(.fail(JobError.onAdd("Can't add item")))
        }
    }
    
    override func onRemove(result: JobCompletion) {
        switch result {
        case .success:
            print("SUCCESS ON JOB: with params \(String(describing: self.params))")
        case .fail(let error):
            print("ERROR ON JOB: \(error) with params \(String(describing: self.params)) ")
        }
    }
}
