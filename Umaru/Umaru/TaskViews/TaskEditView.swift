//
//  TaskEditView.swift
//  Umaru
//
//  Created by preccrep on 2022/6/15.
//

import SwiftUI

struct TaskEditView: View {
    @EnvironmentObject var userData: UserData
    private let task: Task
    private var draftTitle: State<String>
//    @State private var draftTitle: String = "Umaru Doma"

    init(task: Task) {
        self.task = task
        self.draftTitle = .init(initialValue: task.title)
    }

    var body: some View {
        let inset = EdgeInsets(top: -8, leading: -10, bottom: -7, trailing: -10)
        return VStack(alignment: .leading, spacing: 0) {
            TextField(
                "Enter New Title...",
                text: self.draftTitle.projectedValue,
                onEditingChanged: { _ in self.updateTask() },
                onCommit: {}
            )
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.clear)
                    .border(Color(red: 0.7, green: 0.7, blue: 0.7), width: 1 / UIScreen.main.scale)
                    .cornerRadius(5)
                    .padding(inset)
            )
            .padding(EdgeInsets(
                top: 15 - inset.top,
                leading: 20 - inset.leading,
                bottom: 15 - inset.bottom,
                trailing: 20 - inset.trailing
            ))

            Spacer()
        }
        .navigationBarTitle(Text("Edit Task"))
    }

    private func updateTask() {
        guard let index = self.userData.tasks.firstIndex(of: self.task) else { return }
        self.userData.tasks[index].title = self.draftTitle.wrappedValue
    }
}

struct TaskEditView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEditView(task: Task(title: "Read SwiftUI Documentation 📚", isDone: false))
    }
}
