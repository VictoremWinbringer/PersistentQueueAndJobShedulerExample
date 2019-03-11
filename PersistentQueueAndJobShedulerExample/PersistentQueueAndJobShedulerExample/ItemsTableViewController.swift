//
//  ItemsTableViewController.swift
//  PersistentQueueAndJobShedulerExample
//
//  Created by Victor Winbringer on 10/03/2019.
//  Copyright © 2019 Victor Winbringer. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    
    var items:[Item]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        updateTable()
    }
    
    func updateTable(){
        self.items = ItemsService.get()
        self.tableView.reloadData()
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
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction.init(style: .normal, title: "Delete", handler: { a, i in
            ItemsService.delete(item: self.items[i.row])
           // self.tableView.deleteRows(at: [i], with: .fade)
            self.updateTable()
        })
        delete.backgroundColor = UIColor.red
        
        let update = UITableViewRowAction.init(style: .normal, title: "Update", handler: { a, i in
            let item = self.items[i.row]
            let alert = UIAlertController(title: "Update", message: "Inter item name", preferredStyle: UIAlertController.Style.alert)
            alert.addTextField(configurationHandler: { t in
                t.placeholder = "name"
                t.text = item.name
            })
            
            let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {[unowned alert] a in
                if let name = alert.textFields?[0].text {
                    item.name = name
                    ItemsService.update(item: item)
                  //  self.tableView.reloadRows(at: [i], with: UITableView.RowAnimation.automatic)
                    self.updateTable()
                }
            })
            let cansel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(ok)
            alert.addAction(cansel)
            self.present(alert, animated: true, completion: nil)
        })
        update.backgroundColor = UIColor.blue
        
        return [update,delete]
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Add", message: "Inter item name", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(configurationHandler: { t in
            t.placeholder = "name"
        })
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {[unowned alert] a in
            if let name = alert.textFields?[0].text {
                ItemsService.add(name: name)
             //   self.tableView.insertRows(at: [IndexPath(row: ItemsService.get().count - 1, section: 0)], with: UITableView.RowAnimation.automatic)
                self.updateTable()
            }
        })
        let cansel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cansel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}
