//
//  TaskRepository.swift
//  TodoApp
//
//  Created by Alfathony on 30/03/19.
//  Copyright © 2019 Universitas Mercu Buana. All rights reserved.
//

import Foundation

protocol TaskRepository {
    func getAll() -> [Task]
    func insert(task:Task)
    func delete(task:Task)
}
