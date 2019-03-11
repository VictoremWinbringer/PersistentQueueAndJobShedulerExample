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
        switch result {
        case .success:
            print("SUCCESS ON JOB: with params \(String(describing: self.params))")
        case .fail(let error):
            print("ERROR ON JOB: \(error) with params \(String(describing: self.params)) ")
        }
    }
    
    private let params: [String: Any]?
    
    required init(params: [String: Any]?) {
        self.params = params
    }
    
    func createItem() -> Item? {
        if let id = self.params?["id"],
            let name = self.params?["name"],
         let uuid = UUID(uuidString: String(describing: id)) {
            return Item(id: uuid , name: String(describing: name))
        } else {
            return nil
        }
    }
    
    func onRetry(error: Error) -> RetryConstraint {
        return  RetryConstraint.cancel
    }
}
