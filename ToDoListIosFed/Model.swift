//
//  Model.swift
//  ToDoListIosFed
//
//  Created by админ on 27/04/2019.
//  Copyright © 2019 дима мак. All rights reserved.
//
//Логика работы приложения
import Foundation

var ToDoItems: [[String: Any]] {
    set{
        UserDefaults.standard.set(newValue, forKey: "ToDoDateKey")
        UserDefaults.standard.synchronize()
    }
    get{
        if let array = UserDefaults.standard.array(forKey: "ToDoDateKey") as? [[String: Any]]{
            return array
        } else{
            return []
        }
    }
}

func addItem(nameItem: String, isCompleted:Bool = false){
    ToDoItems.append(["Name": nameItem, "isCompleted": false])

}

func removeItem(at index: Int){
    ToDoItems.remove(at: index)
}

func changeState(at item:Int) -> Bool{
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
    return ToDoItems[item]["isCompleted"] as! Bool
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = ToDoItems[fromIndex]
    ToDoItems.remove(at: fromIndex)
    ToDoItems.insert(from, at: toIndex)
}
