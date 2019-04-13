//
//  TaskCoreData.swift
//  TodoApp
//
//  Created by Alfathony on 13/04/19.
//  Copyright © 2019 Universitas Mercu Buana. All rights reserved.
//

import Foundation
import CoreData

class TaskCoreData: TaskRepository {
    
    var context : NSManagedObjectContext
    var tasks : [Task] = []
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func getAll() -> [Task] {
        tasks = [Task]()
        do {
            tasks = try context.fetch(Task.fetchRequest())
        } catch {
            print("Fetch failed")
        }
        return tasks
    }
    
    func insert(task: Task) {
        commit()
    }
    
    func delete(task: Task) {
        context.delete(task)
        commit()
    }
    
    func commit(){
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                print("Commit Failed")
            }
        }
    }
    
    
    
}
