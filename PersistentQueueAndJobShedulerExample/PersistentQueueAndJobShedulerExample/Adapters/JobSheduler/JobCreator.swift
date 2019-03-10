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
        if type == AddItemJob.type  {
            return AddItemJob(params: params)
        } else {
            fatalError("No Job !")
        }
    }
}
