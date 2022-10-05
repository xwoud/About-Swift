//
//  TableWatchAppApp.swift
//  TableWatchApp WatchKit Extension
//
//  Created by Hailey on 2021/07/09.
//

import SwiftUI

@main
struct TableWatchAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
