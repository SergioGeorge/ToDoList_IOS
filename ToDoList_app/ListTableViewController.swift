//
//  TableViewController.swift
//  ToDoList_app
//
//  Created by Video on 8/29/19.
//
import Foundation
import UIKit

class ListTableViewController: UITableViewController {
    public var message: String = ""
    
    override func viewDidLoad() {
        print("Hola Tabla \(message)")
        print(ToDoItemDatabase.getInstance().db)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoItemDatabase.getInstance().db.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "dummy_cell") as! UITableViewCell
        
        let it:ToDoItem = ToDoItemDatabase.getInstance().db[indexPath.item]
        
        cell.textLabel?.text = it.itemName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let it: ToDoItem = ToDoItemDatabase.getInstance().db[indexPath.item]
        ToDoItemDatabase.getInstance().itemToEdit = it
        performSegue(withIdentifier: "doDetail", sender: nil)
    }
}
