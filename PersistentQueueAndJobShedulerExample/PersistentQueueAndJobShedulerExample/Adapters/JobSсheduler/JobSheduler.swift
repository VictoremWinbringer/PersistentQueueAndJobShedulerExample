//
//  JobSheduler.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import Foundation
import  SwiftQueue

class JobSсheduler {
    
    static let manager = SwiftQueueManagerBuilder(creator: ApiJobCreator())
    .set(logger: ConsoleLogger())
    .set(persister: UserDefaultsPersister())
    .build()
    
    static func waitUntilAllOperationsAreFinished(){
        manager.waitUntilAllOperationsAreFinished()
    }
    
    class Items {
      private static func addJob(type:String, item:Item){
            JobBuilder(type: type)
                .internet(atLeast: .cellular)
                .with(params: [
                    "id": item.id.description,
                    "name": item.name
                               ])
                .persist(required: true)
                .schedule(manager: manager)
        }
        
        static func add(item:Item){
            addJob(type: AddItemJob.type, item: item)
        }
        
        static func update(item:Item){
            addJob(type: UpdateItemJob.type, item: item)
        }
        
        static func delete(item:Item){
             addJob(type: DeleteItemJob.type, item: item)
        }
        
        static func syncWithServer(){
            JobBuilder(type: SyncWithServerJob.type)
                .internet(atLeast: .cellular)
                .with(params: [:])
                .persist(required: true)
                .schedule(manager: manager)
        }
    }
}
