//
//  NotificationApp.swift
//  Notification
//
//  Created by 강수희 on 2023/06/19.
//

import SwiftUI

@main
struct NotificationApp: App {
    @StateObject private var model = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
