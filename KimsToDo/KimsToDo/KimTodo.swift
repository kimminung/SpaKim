//
//  KimTodo.swift
//  KimsToDo
//
//  Created by 민웅킴 on 3/31/24.
//

import Foundation


struct KimTodo {
    var id: UUID
    var title: String       // 투두의 제목
    var isCompleted: Bool = false   // 완료 여부, true면 완료, false면 미완료
    var createdAt: Date = .init()   //투두 만들때 시점
}
