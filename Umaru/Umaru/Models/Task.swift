//
//  Task.swift
//  Umaru
//
//  Created by preccrep on 2022/6/15.
//

import SwiftUI

struct Task: Equatable, Hashable, Codable, Identifiable {
    let id: UUID
    var title: String
    var isDone: Bool

    init(title: String, isDone: Bool) {
        self.id = UUID()
        self.title = title
        self.isDone = isDone
    }
}
