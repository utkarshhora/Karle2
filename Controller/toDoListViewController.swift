//
//  ViewController.swift
//  Karle
//
//  Created by Utkarsh on 11/01/19.
//  Copyright © 2019 Utkarsh. All rights reserved.
//

import UIKit

class toDoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newItem = Item(title: "first", done: false)
        self.itemArray.append(newItem)
        
        let newItem2 = Item(title: "second", done: false)
        self.itemArray.append(newItem2)
        
        
//        if let items = defaults.array(forKey: "itemArray") as? [Item] {
//            itemArray = items
//        }
        
    }

    
    //MARK - TableView Datasource methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        cell.accessoryType = itemArray[indexPath.row].done == false ? .none : .checkmark
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count

    }
    
    //MARK - TableView Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
    }
    
    
    //MARK - ADD BUTTON
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add a new item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item(title: textField.text!, done: false)
            
            self.itemArray.append(newItem)
            
            //self.defaults.set(self.itemArray, forKey: "itemArray")
            
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create a new Item"
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    
}

