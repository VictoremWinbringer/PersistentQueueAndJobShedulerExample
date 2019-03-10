//
//  ItemsTableViewController.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    var items:[Item] = []
    var port:TableViewControllerPort!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    self.port = TableViewControllerPort()
        loadItems()
    }
    
    private func loadItems(){
        self.items = self.port.items
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.tag = item.id
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction.init(style: .normal, title: "Delete", handler: { a, i in
            
        })
        delete.backgroundColor = UIColor.blue
        let update = UITableViewRowAction.init(style: .normal, title: "Update", handler: { a, i in
            
        })
        update.backgroundColor = UIColor.red
        return [update,delete]
    }
}
