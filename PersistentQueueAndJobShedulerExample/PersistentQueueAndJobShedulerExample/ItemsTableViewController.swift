//
//  ItemsTableViewController.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    var port:TableViewControllerPort!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.port = TableViewControllerPort()
        self.port.add(name: "Test1")
        self.port.add(name: "Test2")
        self.port.add(name: "Test3")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.port.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = self.port.items[indexPath.row]
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
        delete.backgroundColor = UIColor.red
        let update = UITableViewRowAction.init(style: .normal, title: "Update", handler: { a, i in
            
        })
        update.backgroundColor = UIColor.blue
        return [update,delete]
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Add", message: "Inter item name", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(configurationHandler: { t in
            t.placeholder = "name"
        })
        
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {a in
            if let name = alert.textFields?[0].text {
                self.port.add(name: name)
                self.tableView.insertRows(at: [IndexPath(row: self.port.items.count - 1, section: 0)], with: UITableView.RowAnimation.automatic)
            }
        })
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}
