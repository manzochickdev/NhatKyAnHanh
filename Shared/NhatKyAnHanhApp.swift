//
//  NhatKyAnHanhApp.swift
//  Shared
//
//  Created by ECO0836_ANHPT on 08/11/2022.
//

import SwiftUI

@main
struct NhatKyAnHanhApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .defaultFrame()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
