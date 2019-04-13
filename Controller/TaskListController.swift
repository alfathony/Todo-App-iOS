//
//  TaskListController.swift
//  TodoApp
//
//  Created by Alfathony on 30/03/19.
//  Copyright © 2019 Universitas Mercu Buana. All rights reserved.
//

import Foundation
import UIKit

class TaskListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskListTableView: UITableView!
    
    var tasks : [Task] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Count rows of task
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let task = tasks[indexPath.row]
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = task.name
        return cell
    }
    
    func getTalks() {
        let repository = TaskCoreData(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        
        tasks = repository.getAll()
        taskListTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getTalks()
    }
    
    override func viewDidLoad() {
        taskListTableView.delegate = self
        taskListTableView.dataSource = self
    }
}
