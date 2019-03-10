//
//  JobCreator.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation
import SwiftQueue

class ApiJobCreator: JobCreator {
    func create(type: String, params: [String: Any]?) -> Job {
        switch type {
        case AddItemJob.type:
            return AddItemJob(params: params)
        case UpdateItemJob.type:
            return UpdateItemJob(params: params)
        case DeleteItemJob.type:
            return DeleteItemJob(params: params)
        case SyncItemsJob.type:
            return SyncItemsJob(params: params)
        default:
            fatalError("No Job !")
        }
    }
}
