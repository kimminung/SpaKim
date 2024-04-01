//
//  Todo.swift
//  ExampleTodoList
//
//  Created by woochan on 3/28/24.
//

import Foundation

struct Todo {
  var id: UUID
  var title: String                   // 투두의 제목
  var isCompleted: Bool = false       // 완료 여부. true 면 완료, false 면 미완료
  var createdAt: Date = .init()
}
