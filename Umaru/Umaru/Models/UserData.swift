//
//  UserData.swift
//  Umaru
//
//  Created by preccrep on 2022/6/15.
//

import SwiftUI
import Combine

private let defaultTasks: [Task] = [
    Task(title: "Read SwiftUI Documentation 📚", isDone: false),
    Task(title: "Watch WWDC22 Keynote 🎉", isDone: true),
]

final class UserData: ObservableObject {
    let didChange = PassthroughSubject<UserData, Never>()
    @UserDefaultValue(key: "Tasks", defaultValue: defaultTasks)
    var tasks: [Task] {
        didSet {
            didChange.send(self)
        }
    }
}
