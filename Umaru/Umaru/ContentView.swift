//
//  ContentView.swift
//  Umaru
//
//  Created by preccrep on 2022/6/15.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var userData = TaskListView()
    var body: some View {
        NavigationView {
            TaskListView().environmentObject(UserData())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
