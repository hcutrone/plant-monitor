//
//  Plant_MonitorApp.swift
//  Plant Monitor
//
//  Created by Harrison Cutrone on 3/2/23.
//

import SwiftUI

@main
struct Plant_MonitorApp: App {
    @StateObject private var modelData = UserData(user: load("userData.json"))

    var body: some Scene {
        WindowGroup {
            MyPlantsView()
                .environmentObject(modelData)
        }
    }
}
