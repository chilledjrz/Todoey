//
//  ViewController.swift
//  Todoey
//
//  Created by admin on 2/21/19.
//  Copyright © 2019 Hady Ahmed. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    let TodoListArraySave = "ToDoListArray"
    
    var itemArray = [Item]()
    //defaults used to save data
    let defaults = UserDefaults.standard
    //defaults used to save data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view, typically from a nib.
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Cool Story"
        itemArray.append(newItem3)
        
        
        
        
        //defaults used to save data
        if let items = defaults.array(forKey: TodoListArraySave) as? [Item] {
        itemArray = items
//            defaults used to save data
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark :.none
 
        
        
        
        return cell

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print (itemArray [indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
    
    //- MARK - Add new Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the add item button on our ui alert
           
            
            
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append (newItem)
            
            
            //defaults used to save data
            self.defaults.set(self.itemArray, forKey: self.TodoListArraySave)
            //defaults used to save data
            
            self.tableView.reloadData()
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new item"
            textField = alertTextField
            
            
        }
        
        
        alert.addAction(action)
        
        present(alert,animated: true, completion: nil)
        
        
    }
    
    
}



