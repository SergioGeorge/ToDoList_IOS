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
        //print("Hola Tabla \(message)")
        //print(ToDoItemDatabase.getInstance().db)
        
        navigationItem.leftBarButtonItem = editButtonItem//<-- Es un obj que existe dentro del TableViewController
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addItem))//target el obj donde esta el callback
        //los selectores ejecutan funciones
        
    }
    
    @objc func addItem() -> Void {
        performSegue(withIdentifier: "addTask", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //To do, renove to do item
        print("Execute delete item")
        ToDoItemDatabase.getInstance().removeItem(index: indexPath.row)
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
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
        
        if it.switchState == true {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let it: ToDoItem = ToDoItemDatabase.getInstance().db[indexPath.item]
        ToDoItemDatabase.getInstance().itemToEdit = it
        performSegue(withIdentifier: "doDetail", sender: nil)
    }
}
