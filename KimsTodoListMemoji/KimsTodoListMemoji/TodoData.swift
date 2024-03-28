//
//  TodoData.swift
//  KimsTodoListMemoji
//
//  Created by 민웅킴 on 3/28/24.
//

import Foundation

struct Todo {
    
    var todoID : Int
    var todoTitle : String
    var isCompleted : Bool
    
}

extension Todo {
    static let list = [
    Todo(todoID: 1,
        todoTitle: "나 오늘 ",
        isCompleted: true),
    Todo(todoID: 2,
        todoTitle: "나 어제 ",
        isCompleted: false),
    Todo(todoID: 3,
        todoTitle: "너 오늘 ",
        isCompleted: false)
    ]
}
