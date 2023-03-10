//
//  Notifications.swift
//  Plant Monitor
//
//  Created by Harrison Cutrone on 3/3/23.
//

import SwiftUI

struct Notifications: View {
    @EnvironmentObject var modelData: ModelData
    var plant: PlantObject
    @State private var all: Bool = false
    
    func disableAllNotifications() {
//        modelData.users[0].plants[0].notifications.moisture = false
//        modelData.users[0].plants[0].notifications.temperature = false
//        modelData.users[0].plants[0].notifications.sunlight = false
//        modelData.users[0].plants[0].notifications.pH = false
//        all = false
    }
    
    var body: some View {
        VStack {
            Text(plant.plantName + "'s Notifications")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            VStack {
//                NotifToggle(label: "Soil Moisture", isOn: $modelData.users[0].plants[0].notifications.moisture)
//                NotifToggle(label: "Temperature", isOn: $modelData.users[0].plants[0].notifications.temperature)
//                NotifToggle(label: "Sunlight", isOn: $modelData.users[0].plants[0].notifications.sunlight)
//                NotifToggle(label: "pH", isOn: $modelData.users[0].plants[0].notifications.pH)
                NotifToggle(label: "All", isOn: $all)
                    .onChange(of: all) { value in
                        if (value) {
//                            modelData.users[0].plants[0].notifications.moisture = true
//                            modelData.users[0].plants[0].notifications.temperature = true
//                            modelData.users[0].plants[0].notifications.sunlight = true
//                            modelData.users[0].plants[0].notifications.pH = true
                        }
                    }
            }
            .padding()
            Spacer()
            Button(action: disableAllNotifications) {
                Text("Turn off all notifications")
            }
        }
        .padding(.horizontal)
    }
    
    struct NotifToggle: View {
        var label: String
        var isOn: Binding<Bool>
        var body: some View {
            Toggle(label, isOn: isOn)
                .padding()
                .font(.title3)
        }
    }
}


struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications(plant: ModelData().users[0].plants[0])
    }
}
