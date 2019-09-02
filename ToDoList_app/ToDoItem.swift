//
//  ToDoItem.swift
//  ToDoList_app
//
//  Created by Video on 9/2/19.
//

import Foundation

class ToDoItem {
    private var name: String
    private var isDone: Bool
    
    public var itemName: String {
        get {
            return name
        }
        
        set(itn){
            name = itn
        }
        
    }
    
    init(name: String) {
        self.name = name
        isDone = false
    }
    
    
    
}
