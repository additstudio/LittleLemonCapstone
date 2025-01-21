//
//  LittleLemonCapstoneApp.swift
//  LittleLemonCapstone
//
//  Created by Cindy Wai Yan Cheung on 21/1/2025.
//

import SwiftUI

@main
struct LittleLemonCapstoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
