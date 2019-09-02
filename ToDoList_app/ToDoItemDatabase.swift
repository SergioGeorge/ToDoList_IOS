//
//  ToDoItemDatabase.swift
//  ToDoList_app
//
//  Created by Video on 9/2/19.
//

import Foundation

class ToDoItemDatabase: CustomStringConvertible {
    private var items: Array<ToDoItem>?
    private static var database: ToDoItemDatabase?
    //private var items: [ToDoItem]?
    
    init() {
        items = Array<ToDoItem>()
    }
    
    public var db: Array<ToDoItem> {
        
        get {
            return items!
        }
        
        set(its) {
            print("Estoy insertando")
            self.items = its//Esta forma de guardar datos en la BD es insegura
        }
    }
    
    public func appendItem(it: ToDoItem) {
        items?.append(it)
    }
    
    public static func getInstance() -> ToDoItemDatabase {
        if(database == nil) {
            database = ToDoItemDatabase()
        }
        return database!
    }
    
    public var description: String{
        var str = db[0].itemName
        return "\(str)"
    }
    
}