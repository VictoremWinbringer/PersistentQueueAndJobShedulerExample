//
//  BaseItemJob.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation
import SwiftQueue

class BaseItemsJob: Job {
    func onRun(callback: JobResult) {
        //do nothing
    }
    
    func onRemove(result: JobCompletion) {
        //do nothing
    }
    
    let params: [String: Any]?
    
    required init(params: [String: Any]?) {
        self.params = params
    }
    
    func createItem() -> Item? {
        let item = Item()
        if let id = Int(self.params?["id"].debugDescription ?? ""),
            let name = self.params?["name"].debugDescription {
            item.id = id
            item.name = name
            return item
        } else {
            return nil
        }
    }
    
    func onRetry(error: Error) -> RetryConstraint {
        return  RetryConstraint.cancel
    }
}
