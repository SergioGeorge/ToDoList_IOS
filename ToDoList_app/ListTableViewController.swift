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
}
